# TOON Kanban Project Overview

> **Purpose:** Enhance Anamnesis framework with visual task management using TOON format and VS Code integration
> **Status:** Design Phase - Pre-Implementation
> **Created:** 2025-12-09
> **Authors:** Anamnesis Framework Team

---

## Executive Summary

This project proposes enhancing the Anamnesis framework with visual task management capabilities through a hybrid approach combining TOON (Token-Oriented Object Notation) format with VS Code extension for kanban board visualization.

### Core Innovation
- **TOON Format**: LLM-optimized data format reducing token usage by 30-60%
- **Visual Management**: Kanban board interface for task visualization and manipulation
- **Framework Integration**: Maintains Anamnesis's thinking-first philosophy while adding execution efficiency
- **Hybrid Approach**: Gradual migration path preserving existing workflows

## Problem Statement

**Current Anamnesis Limitations:**
1. **No Visual Progress**: Markdown checkboxes provide no at-a-glance project status
2. **Manual Tracking**: Task status updates require manual text editing
3. **Limited Relationships**: No dependency management or task hierarchy
4. **Context Switching**: Difficult to manage parallel workstreams
5. **Tool Integration**: Poor integration with modern development environments

**User Pain Points:**
- "I can't see project bottlenecks at a glance"
- "Managing multiple parallel features is confusing"
- "Task dependencies are hard to track"
- "Switching between thinking and execution is context-heavy"
- "I want visual management without losing Anamnesis's thoughtful approach"

## Solution Vision

### Core Components

1. **TOON Task Format**
   - Structured data format optimized for LLM contexts
   - Supports rich task relationships (dependencies, hierarchy, metadata)
   - Human-readable and git-friendly
   - Compatible with existing tooling ecosystem

2. **VS Code Kanban Extension**
   - Visual board with drag-and-drop task management
   - Real-time synchronization with TOON files
   - Integration with existing VS Code workflows
   - Support for multiple workstreams

3. **Anamnesis Integration**
   - Bidirectional sync between specs and TOON tasks
   - Preserves thinking-first development approach
   - Gradual migration path from markdown to TOON
   - Maintains framework philosophy

### Key Benefits

- **Visual Management**: At-a-glance project status and bottlenecks
- **Token Efficiency**: 30-60% reduction in LLM context usage
- **Rich Relationships**: Support for dependencies, parent-child tasks, priorities
- **IDE Integration**: Native VS Code experience without leaving editor
- **Framework Compatibility**: Enhances rather than replaces Anamnesis
- **Gradual Adoption**: Users can migrate at their own pace

## Project Scope

### In Scope
- TOON schema design for task management
- VS Code extension for kanban visualization
- Bidirectional sync with Anamnesis specs
- Migration tools from existing markdown tasks
- Documentation and workflow guides

### Out of Scope
- Complete replacement of Anamnesis framework
- Real-time collaboration features
- Cloud synchronization or multi-user support
- Advanced project management (time tracking, resource allocation)
- Mobile or web interfaces

## Success Criteria

1. **Functional Success**
   - TOON format supports required task relationships
   - VS Code extension provides working kanban board
   - Bidirectional sync maintains data integrity
   - Migration tools preserve existing task data

2. **User Experience Success**
   - Visual management reduces cognitive load
   - Learning curve is manageable for existing Anamnesis users
   - Workflow integration feels natural, not forced

3. **Technical Success**
   - Performance acceptable for projects with 100+ tasks
   - Git operations remain clean and conflict-free
   - Extension works reliably across VS Code versions

4. **Framework Success**
   - Anamnesis philosophy preserved and enhanced
   - Existing workflows remain functional
   - New capabilities integrate seamlessly with thinking phases

## Risk Assessment

### High-Risk Areas
- **TOON Format Adoption**: New format with limited ecosystem support
- **VS Code Extension Complexity**: Unknown development challenges
- **Sync Logic Complexity**: Bidirectional synchronization between formats
- **User Acceptance**: Resistance to changing established workflows

### Mitigation Strategies
- **POC-First Approach**: Validate concepts before framework integration
- **Hybrid Format Support**: Support both markdown and TOON during transition
- **Incremental Rollout**: Gradual feature introduction based on user feedback
- **Extensive Testing**: Real-world validation before framework commitment

## Timeline Overview

- **Phase 1**: POC Development (2 weeks) - Validate TOON + VS Code extension
- **Phase 2**: Integration (4 weeks) - Connect with Anamnesis framework
- **Phase 3**: Enhancement (2 weeks) - Advanced features and optimization
- **Phase 4**: Rollout (2 weeks) - Documentation, testing, release

---

*This document serves as the foundation for project planning and decision-making. All subsequent documents should reference these core principles and success criteria.*