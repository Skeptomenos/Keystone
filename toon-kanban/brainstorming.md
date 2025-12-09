# Brainstorming & Discussion History

> **Purpose:** Document evolution of ideas, challenges, and decisions for TOON Kanban project
> **Format:** Chronological discussion with key insights and pivots
> **Updated:** Continuously as discussions progress

---

## 2025-12-09: Initial Kanban Board Idea

### Original Problem Statement
*"I want to improve the project management of my framework. My dream would be to have a kanban board like organisation for backlock, open, in progress and done. Development is not straight forward, sometimes you need to branche, focus on a side task and come back to other tasks or epics later. The framework is not capable yet of managing these things."*

### Initial Analysis
- **Current State**: Linear task management via `specs/tasks.md` checkboxes
- **Gap**: No visual progress tracking, limited support for parallel workstreams
- **User Need**: Kanban-style organization with branching capability

### Key Insights
1. **Visual Management**: Kanban boards solve at-a-glance progress tracking
2. **Branching Support**: Modern development requires context switching between workstreams
3. **Framework Integration**: Must preserve Anamnesis's thinking-first philosophy
4. **Incremental Enhancement**: Avoid breaking existing workflows

---

## 2025-12-09: Task Master Discovery

### Research Findings
- **Task Master**: AI-powered task management with 24.1k GitHub stars
- **MCP Integration**: Proven approach for IDE integration
- **JSON Format**: Structured task data with rich relationships
- **Automation**: Automatic task breakdown from PRDs

### Integration Options Analyzed
1. **MCP Bridge**: Use Task Master's existing MCP server
2. **Direct Integration**: Embed Task Master functionality
3. **Enhanced Anamnesis**: Build native task management

### Key Decision Point
*"Should we integrate with existing Task Master or build our own solution?"*

**Critical Insight**: Task Master proves JSON format + MCP integration works, but may not align with Anamnesis's philosophy.

---

## 2025-12-09: TOON Format Discovery

### Format Analysis
- **TOON**: Token-Oriented Object Notation, optimized for LLM contexts
- **Token Efficiency**: 30-60% reduction vs JSON
- **Specification**: Working Draft v3.0, comprehensive and well-defined
- **VS Code Compatibility**: Can build extension for TOON parsing

### Advantages Over JSON
1. **LLM Optimization**: Designed specifically for AI context windows
2. **Human Readable**: More compact than JSON, less verbose than YAML
3. **Structured**: Supports arrays, objects, rich metadata
4. **Git-Friendly**: Line-oriented format diffs cleanly

### Challenges Identified
1. **New Format**: Limited ecosystem vs. established JSON
2. **Tooling Gaps**: Fewer parsers and libraries
3. **Maturity**: Working Draft specification, evolving
4. **Adoption Risk**: Users must learn new syntax

---

## 2025-12-09: VS Code Extension Strategy

### Technical Assessment
- **Extension API**: VS Code provides robust extension development framework
- **File Watching**: Can monitor TOON file changes in real-time
- **UI Components**: Drag-and-drop kanban boards are well-supported
- **Marketplace**: Direct distribution path to users

### Implementation Complexity
- **TOON Parser**: Need reliable TOON parsing library
- **State Management**: Synchronize UI state with file system
- **Performance**: Must handle projects with 100+ tasks efficiently
- **User Experience**: Intuitive drag-and-drop, keyboard shortcuts

### Key Decision
*"Can we build a working VS Code extension for TOON kanban boards?"*

**Conclusion**: Technically feasible, but requires dedicated development effort.

---

## 2025-12-09: POC-First Strategy

### Strategic Pivot
After analyzing multiple approaches, the team concluded that direct integration carries too much risk. Key insights:

#### Risk Analysis
- **Direct Integration**: High risk, potential framework disruption
- **POC-First**: Lower risk, validates assumptions before commitment
- **Separate Project**: Isolates innovation from stable framework

#### Decision Framework
1. **Validate TOON Viability**: Prove format works for task management
2. **Test Extension Feasibility**: Confirm VS Code development approach
3. **User Experience Testing**: Validate with real developers
4. **Integration Planning**: Use POC learnings for framework integration

### Core Insight
*"It's better to have a small, disposable project that proves the concept than to risk the main framework on an unproven approach."*

---

## 2025-12-09: Final Architecture Decision

### Chosen Approach: Hybrid Format with Gradual Migration

#### Rationale
1. **Preserves Existing Workflows**: No forced migration from markdown
2. **Provides Innovation**: TOON format + visual management benefits
3. **Risk Mitigation**: Users can adopt at their own pace
4. **Framework Integrity**: Anamnesis philosophy maintained and enhanced

#### Implementation Strategy
- **Phase 1**: POC development (separate project)
- **Phase 2**: Framework integration based on POC learnings
- **Phase 3**: Gradual rollout with hybrid support

### Success Criteria
- POC validates TOON + VS Code extension viability
- Integration path is clear and low-risk
- User adoption is smooth, not disruptive
- Framework enhancement rather than replacement

---

## Key Discussion Themes

### 1. Format Evolution
- **Markdown → JSON → TOON**: Progressive enhancement of data structure
- **Human vs. Machine**: Balance between readability and automation
- **Ecosystem Considerations**: Tool support vs. innovation benefits

### 2. Integration Philosophy
- **Enhancement, Not Replacement**: Preserve Anamnesis strengths
- **Gradual Migration**: Allow users to adopt incrementally
- **Choice Architecture**: Support multiple formats during transition

### 3. Risk Management
- **POC-First Development**: Validate before committing
- **Separate Validation**: Isolate innovation from stable framework
- **User Testing**: Real-world validation before rollout

### 4. User Experience
- **Visual Management**: Solve at-a-glance progress tracking
- **Workflow Preservation**: Don't break existing habits
- **Learning Curve**: Minimize disruption for current users

---

## Decision Log

### 2025-12-09-01: Kanban Board Requirement
**Decision**: Project needs visual task management with branching support
**Rationale**: Current linear approach insufficient for modern development workflows

### 2025-12-09-02: Task Master Evaluation
**Decision**: Task Master integration considered but not chosen
**Rationale**: Proven approach but potential philosophy mismatch with Anamnesis

### 2025-12-09-03: TOON Format Selection
**Decision**: Adopt TOON format for task data structure
**Rationale**: LLM-optimized, human-readable, supports rich relationships

### 2025-12-09-04: POC-First Strategy
**Decision**: Build separate POC project before framework integration
**Rationale**: Minimize risk, validate assumptions, preserve framework stability

### 2025-12-09-05: Hybrid Format Approach
**Decision**: Support both markdown and TOON during transition
**Rationale**: Gradual migration, user choice, workflow preservation

---

## Open Questions

1. **TOON Schema Design**: How to map Anamnesis task concepts to TOON structure?
2. **Migration Tools**: What's the best approach for converting existing markdown tasks?
3. **User Training**: How to help users transition from checkboxes to kanban?
4. **Performance**: How will TOON format perform with large projects (1000+ tasks)?
5. **Ecosystem**: Will TOON adoption create tooling dependencies?

---

## Next Steps

1. **POC Development**: Build TOON + VS Code extension validation
2. **User Testing**: Validate with real Anamnesis users
3. **Integration Planning**: Use POC learnings for framework enhancement
4. **Documentation**: Create migration guides and workflow documentation
5. **Community Engagement**: Contribute to TOON specification and tooling

---

*This document captures the evolution of our thinking from initial problem identification through final architectural decisions. It serves as context for future development and decision-making.*