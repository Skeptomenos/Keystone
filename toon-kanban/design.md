# Design Document: TOON Kanban System

> **Purpose:** Technical design for TOON format task management and VS Code integration
> **Status:** Design Phase - Ready for Implementation
> **Version:** 1.0
> **Created:** 2025-12-09
> **Authors:** Anamnesis Framework Team

---

## System Architecture

### High-Level Overview

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   Anamnesis    │    │   TOON Format    │    │  VS Code       │
│   Framework      │◄──►│   Task Data      │◄──►│  Extension       │
│                 │    │                 │    │                 │
│ • specs/        │    │ • tasks.toon     │    │ • Kanban UI    │
│ • thinking/      │    │ • relationships   │    │ • Drag & Drop  │
│ • execution/     │    │ • metadata       │    │ • Real-time    │
└─────────────────┘    └──────────────────┘    └─────────────────┘
```

### Core Components

1. **Anamnesis Framework**
   - **Spec Generation**: Thinking phases produce structured requirements
   - **Task Creation**: Manual and automated task generation
   - **State Management**: Active session tracking and handover
   - **Philosophy**: Thinking-first, deliberate development

2. **TOON Task Store**
   - **Format**: Token-Oriented Object Notation
   - **Schema**: Structured task relationships and metadata
   - **Benefits**: LLM-optimized, human-readable, git-friendly
   - **Location**: `.context/tasks.toon` (primary) + `specs/tasks.toon` (generated)

3. **VS Code Extension**
   - **Visualization**: Kanban board with columns and cards
   - **Interaction**: Drag-and-drop task management
   - **Synchronization**: Real-time TOON file watching
   - **Integration**: Native VS Code workflow support

## Data Flow Architecture

### 1. Task Creation Flow
```
Anamnesis Specs → TOON Generator → tasks.toon → VS Code Extension → Kanban Board
```

**Process:**
1. **Thinking Phase**: `anamnesis/directives/THINKING.md` generates specs
2. **Task Generation**: Specs converted to TOON format tasks
3. **File Storage**: Tasks saved in `.context/tasks.toon`
4. **UI Update**: VS Code extension detects changes and updates board

### 2. Task Management Flow
```
User Interaction → VS Code Extension → TOON File Update → Anamnesis Sync
```

**Operations:**
- **Create Task**: Add new task via UI → append to TOON file
- **Update Status**: Drag task between columns → update status field
- **Edit Task**: Modify task details → update TOON record
- **Delete Task**: Remove task → delete from TOON file
- **Batch Ops**: Multi-select operations → bulk TOON updates

### 3. Bidirectional Sync Flow
```
TOON File Changes ← VS Code Extension ← Anamnesis Updates
```

**Synchronization Logic:**
- **File Watching**: VS Code extension monitors `.context/tasks.toon`
- **Conflict Resolution**: Timestamp-based change detection
- **State Preservation**: Maintain Anamnesis active_state.md
- **Handover Support**: Session continuity across restarts

## TOON Schema Design

### Core Task Structure

```toon
tasks[N]{id,title,status,priority,dependencies,children,tags,specs_link,created,updated}:
  TASK-001,"User Authentication System","backlog","high","","","auth,security","specs/requirements.md","2025-12-09T10:00:00Z","2025-12-09T10:00:00Z"
  TASK-002,"Database Schema Design","backlog","high","TASK-001","","database,backend","specs/tech.md","2025-12-09T10:00:00Z","2025-12-09T10:00:00Z"
  TASK-003,"API Endpoint Implementation","ready","medium","TASK-001,TASK-002","","api,backend","specs/requirements.md","2025-12-09T10:00:00Z","2025-12-09T10:00:00Z"
  TASK-004,"Frontend Integration","in-progress","medium","TASK-003","","frontend,ui","specs/design.md","2025-12-09T10:00:00Z","2025-12-09T10:00:00Z"
  TASK-005,"Testing & QA","review","low","TASK-004","","testing,qa","specs/tasks.md","2025-12-09T10:00:00Z","2025-12-09T10:00:00Z"
```

### Field Definitions

| Field | Type | Description | Required |
|--------|------|-------------|----------|
| id | string | Unique task identifier (TASK-XXX format) | Yes |
| title | string | Human-readable task title | Yes |
| status | string | Task status (backlog/ready/in-progress/review/done) | Yes |
| priority | string | Priority level (low/medium/high/critical) | No |
| dependencies | string | Comma-separated task IDs | No |
| children | string | Comma-separated child task IDs | No |
| tags | string | Comma-separated task tags | No |
| specs_link | string | Link to relevant Anamnesis spec file | No |
| created | string | ISO 8601 creation timestamp | Yes |
| updated | string | ISO 8601 last update timestamp | Yes |

### Status Workflow

```toon
columns[5]{id,title,description,wip_limit}:
  backlog,"Backlog","Tasks not yet ready for work",null
  ready,"Ready","Tasks ready to be started",3
  in-progress,"In Progress","Currently being worked on",1
  review,"Review","Completed work needing review",null
  done,"Done","Completed and verified tasks",null
```

### Task Relationships

```toon
dependencies[2]{parent_id,child_id,relationship_type}:
  TASK-001,TASK-002,"blocks"
  TASK-002,TASK-003,"blocks"
  TASK-003,TASK-004,"enables"
```

## VS Code Extension Architecture

### Extension Structure
```
extension/
├── src/
│   ├── extension.ts          # Main extension entry point
│   ├── kanban/
│   │   ├── KanbanBoard.ts   # Main board component
│   │   ├── TaskCard.ts      # Individual task component
│   │   ├── Column.ts        # Kanban column component
│   │   └── DragDrop.ts     # Drag-and-drop logic
│   ├── toon/
│   │   ├── ToonParser.ts    # TOON format parser
│   │   ├── ToonWriter.ts    # TOON format writer
│   │   └── TaskManager.ts   # Task state management
│   └── sync/
│       ├── FileWatcher.ts   # File system monitoring
│       ├── SyncManager.ts   # Bidirectional sync logic
│       └── ConflictResolver.ts # Change conflict handling
├── package.json
├── tsconfig.json
└── README.md
```

### Core Features

#### 1. Kanban Board Visualization
- **Column Layout**: Backlog, Ready, In Progress, Review, Done
- **Task Cards**: Visual representation with key information
- **Drag & Drop**: Move tasks between columns
- **Keyboard Navigation**: Arrow keys, shortcuts for common actions
- **Filtering**: By status, priority, tags, assignee

#### 2. Task Management
- **Create Task**: Quick-add form with TOON integration
- **Edit Task**: In-place editing with validation
- **Delete Task**: Confirmation dialog with cascade options
- **Bulk Operations**: Multi-select for batch changes
- **Search**: Full-text search across task titles and descriptions

#### 3. Real-time Synchronization
- **File Watching**: Monitor `.context/tasks.toon` changes
- **Auto-refresh**: Update UI when file changes externally
- **Conflict Detection**: Identify concurrent modifications
- **Backup Support**: Auto-backup before conflicts

#### 4. Anamnesis Integration
- **Spec Linking**: Navigate to related Anamnesis specs
- **Status Sync**: Update Anamnesis active_state.md
- **Handover Support**: Session continuity features
- **Workflow Preservation**: Maintain thinking-first approach

### Technical Implementation

#### 1. TOON Parser
```typescript
class ToonParser {
  parse(content: string): TaskData {
    // Parse TOON format into structured data
    // Handle tabular arrays, objects, relationships
    // Validate schema compliance
  }
  
  validate(taskData: TaskData): ValidationResult {
    // Ensure data integrity
    // Check required fields, relationships
    // Validate status transitions
  }
}
```

#### 2. File System Integration
```typescript
class FileWatcher {
  watchFile(filePath: string): void {
    // Monitor TOON file changes
    // Trigger UI updates on modification
    // Handle external edit conflicts
  }
  
  syncToFile(tasks: TaskData): void {
    // Write task changes to TOON format
    // Maintain atomic updates
    // Create backup before changes
  }
}
```

#### 3. Kanban State Management
```typescript
class KanbanBoard {
  tasks: Map<string, Task>
  columns: Map<string, Column>
  
  moveTask(taskId: string, fromColumn: string, toColumn: string): void {
    // Update task status
    // Validate workflow rules
    // Sync to TOON file
  }
  
  addTask(task: Task): void {
    // Add to appropriate column
    // Update TOON file
    // Trigger file watcher
  }
}
```

## Integration with Anamnesis Framework

### 1. Spec-to-Task Generation

```javascript
// anamnesis/integration/task-generator.js
class TaskGenerator {
  generateFromSpecs(specsPath: string): TaskData {
    // Read anamnesis/specs/ files
    // Extract requirements and user stories
    // Generate structured tasks with relationships
    // Output in TOON format
  }
  
  updateFromActiveState(activeStatePath: string): TaskData {
    // Sync with Anamnesis session state
    // Update task statuses based on progress
    // Maintain handover continuity
  }
}
```

### 2. Bidirectional Synchronization

```javascript
// anamnesis/integration/sync-manager.js
class SyncManager {
  toonToAnamnesis(toonData: TaskData): void {
    // Update anamnesis/specs/tasks.md
    // Sync status changes to active_state.md
    // Maintain framework consistency
  }
  
  anamnesisToToon(anamnesisData: any): TaskData {
    // Read markdown task status
    // Convert to TOON format
    // Update tasks.toon file
  }
  
  resolveConflicts(toonChanges: Change[], anamnesisChanges: Change[]): Resolution {
    // Timestamp-based conflict resolution
    // User notification for manual resolution
    // Maintain data integrity
  }
}
```

### 3. Workflow Enhancement

```javascript
// Enhanced anamnesis/directives/EXECUTION.md additions
const taskManagementWorkflow = {
  // Before starting work
  "checkKanbanBoard": "Review VS Code kanban for next task",
  "updateTaskStatus": "Move task card to appropriate column",
  "syncToAnamnesis": "Ensure changes reflect in framework state",
  
  // During work
  "trackProgress": "Update task status as work progresses",
  "handleBlockers": "Move blocked tasks to appropriate status",
  "documentDecisions": "Link task completion to DECISION_LOG.md",
  
  // After completion
  "markComplete": "Move task to Done column",
  "updateHandover": "Update active_state.md for next session",
  "archiveCompleted": "Archive finished tasks per workflow"
};
```

## Implementation Phases

### Phase 1: POC Development (Weeks 1-2)

#### Sprint 1: TOON Schema & Parser
- [ ] Define complete TOON schema for task management
- [ ] Implement TOON parser with validation
- [ ] Create sample tasks.toon files
- [ ] Test with realistic task data volumes

#### Sprint 2: VS Code Extension MVP
- [ ] Basic extension structure and manifest
- [ ] TOON file reading and parsing
- [ ] Simple kanban board with columns
- [ ] Drag-and-drop task movement
- [ ] File watching and auto-refresh

#### Sprint 3: Basic Integration
- [ ] Anamnesis spec reading capability
- [ ] Task generation from specs
- [ ] Bidirectional sync prototype
- [ ] Basic conflict detection

### Phase 2: Integration & Enhancement (Weeks 3-4)

#### Sprint 4: Advanced Features
- [ ] Task creation and editing forms
- [ ] Advanced filtering and search
- [ ] Bulk operations support
- [ ] Keyboard shortcuts and navigation
- [ ] Performance optimization for large projects

#### Sprint 5: Deep Integration
- [ ] Complete Anamnesis framework integration
- [ ] Migration tools from markdown tasks
- [ ] Handover and session management
- [ ] Workflow documentation and guides

#### Sprint 6: Polish & Testing
- [ ] User experience optimization
- [ ] Error handling and recovery
- [ ] Performance testing with 100+ tasks
- [ ] Documentation and user guides

### Phase 3: Framework Integration (Weeks 5-6)

#### Sprint 7: Anamnesis Enhancement
- [ ] Update THINKING.md for task generation
- [ ] Modify EXECUTION.md for kanban workflow
- [ ] Add TASK_MANAGEMENT.md directive
- [ ] Create migration tools and guides
- [ ] Update templates for TOON support

#### Sprint 8: Rollout Preparation
- [ ] Comprehensive testing with real projects
- [ ] User feedback collection and iteration
- [ ] Documentation completion
- [ ] Release preparation and distribution

## Success Metrics

### Technical Metrics
- **Performance**: <100ms response time for 100 tasks
- **Memory**: <50MB for typical project sizes
- **Reliability**: <1% sync failures, <0.1% data corruption
- **Compatibility**: VS Code 1.85+, Node.js 18+

### User Experience Metrics
- **Learning Curve**: <30 minutes for basic kanban usage
- **Task Efficiency**: 50% reduction in status update time
- **Visual Clarity**: 90% user satisfaction with at-a-glance status
- **Workflow Integration**: 80% reduction in context switching time

### Framework Metrics
- **Philosophy Preservation**: 100% compatibility with existing workflows
- **Migration Success**: 95% automatic conversion from markdown tasks
- **Integration Depth**: Seamless bidirectional sync with Anamnesis state
- **Enhancement Value**: Measurable improvement in project management capability

---

*This design document provides the technical foundation for implementing TOON Kanban system while preserving and enhancing Anamnesis framework capabilities.*