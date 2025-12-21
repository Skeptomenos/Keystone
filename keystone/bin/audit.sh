#!/bin/bash

# Keystone Rigid Auditor (v1.0)
# Purpose: Automated quality gate for the keystone_starter distributable.

set -e

# Configuration
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
STARTER_DIR="$REPO_ROOT/keystone_starter"
INITIATOR="$STARTER_DIR/INITIATOR.md"
AGENTS="$STARTER_DIR/AGENTS.md"
THINKING="$STARTER_DIR/keystone/directives/THINKING.md"
EXECUTION="$STARTER_DIR/keystone/directives/EXECUTION.md"
CHANGELOG="$STARTER_DIR/CHANGELOG.md"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "🔍 Starting Keystone Rigid Audit..."
echo "-----------------------------------"

FAILED=0

# Check A: Path Integrity
echo -n "Checking Path Integrity... "
MISSING_PATHS=()
# Extract paths from AGENTS.md (looking for `keystone/...` or `INITIATOR.md`)
# We look for strings starting with keystone/ or INITIATOR.md
PATHS=$(grep -oE "(keystone/[a-zA-Z0-9_/-]+\.md|keystone/[a-zA-Z0-9_/-]+\*|INITIATOR\.md)" "$AGENTS" | sed 's/\*//' | sort -u)

for p in $PATHS; do
    if [ ! -e "$STARTER_DIR/$p" ] && [ ! -d "$STARTER_DIR/$p" ]; then
        MISSING_PATHS+=("$p")
    fi
done

if [ ${#MISSING_PATHS[@]} -eq 0 ]; then
    echo -e "${GREEN}PASS${NC}"
else
    echo -e "${RED}FAIL${NC}"
    for p in "${MISSING_PATHS[@]}"; do
        echo -e "  - Missing: $p"
    done
    FAILED=1
fi

# Check B: Template Sync (MVA vs Actual)
echo -n "Checking Template Sync... "
# This is a simplified check: verify that MVA headers exist in INITIATOR.md
MVA_HEADERS=("mission.md" "tasks.md" "problem.md" "DISCOVERY.md" "MIGRATION_PREVIEW.md" "health.md")
MISSING_MVA=()

for h in "${MVA_HEADERS[@]}"; do
    if ! grep -q "### $h" "$INITIATOR"; then
        MISSING_MVA+=("$h")
    fi
done

if [ ${#MISSING_MVA[@]} -eq 0 ]; then
    echo -e "${GREEN}PASS${NC}"
else
    echo -e "${RED}FAIL${NC}"
    for h in "${MISSING_MVA[@]}"; do
        echo -e "  - Missing MVA Template: $h"
    done
    FAILED=1
fi

# Check C: Protocol Consistency
echo -n "Checking Protocol Consistency... "
# Verify that phases mentioned in INITIATOR exist in directives
# Look for "Phase X: Name" or "Phase T-RFL" (ignoring trailing punctuation)
PHASES=$(grep -oE "Phase [0-9T][^: )]+" "$INITIATOR" | sort -u)
MISSING_PHASES=()

for ph in $PHASES; do
    # Skip Phase Overview or generic mentions
    if [[ "$ph" == "Phase Overview" ]]; then continue; fi
    
    if ! grep -q "## $ph" "$THINKING" && ! grep -q "## $ph" "$EXECUTION"; then
        # Special case for INITIATOR's own phases
        if ! grep -q "### $ph" "$INITIATOR"; then
            MISSING_PHASES+=("$ph")
        fi
    fi
done

if [ ${#MISSING_PHASES[@]} -eq 0 ]; then
    echo -e "${GREEN}PASS${NC}"
else
    echo -e "${YELLOW}WARN${NC} (Manual check recommended)"
    for ph in "${MISSING_PHASES[@]}"; do
        echo -e "  - Phase not found in directives: $ph"
    done
    # We don't fail on this yet as naming can vary slightly
fi

# Check D: Version Alignment
echo -n "Checking Version Alignment... "
VERSION=$(grep -oE "\[[0-9]+\.[0-9]+\.[0-9]+\]" "$CHANGELOG" | head -n 1 | tr -d '[]')
THINKING_VER=$(grep -oE "Protocol Version: [0-9]+\.[0-9]+" "$THINKING" | awk '{print $NF}')
EXECUTION_VER=$(grep -oE "Protocol Version: [0-9]+\.[0-9]+" "$EXECUTION" | awk '{print $NF}')

# Compare major.minor
if [[ "$VERSION" == "$THINKING_VER"* ]] && [[ "$VERSION" == "$EXECUTION_VER"* ]]; then
    echo -e "${GREEN}PASS${NC} ($VERSION)"
else
    echo -e "${RED}FAIL${NC}"
    echo -e "  - Changelog: $VERSION"
    echo -e "  - Thinking:  $THINKING_VER"
    echo -e "  - Execution: $EXECUTION_VER"
    FAILED=1
fi

echo "-----------------------------------"
if [ $FAILED -eq 0 ]; then
    echo -e "🚀 ${GREEN}Starter is healthy and ready for distribution.${NC}"
    exit 0
else
    echo -e "❌ ${RED}Audit failed. Please fix the issues above.${NC}"
    exit 1
fi
