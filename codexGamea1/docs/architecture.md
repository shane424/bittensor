# Architecture

## Current slice

`world_prototype.tscn` owns composition only. Input orchestration lives in
`world_controller.gd`; survivor selection/movement lives in `survivor.gd`; and
camera behavior lives in `rts_camera.gd`. This keeps input, units, and camera
behavior independently replaceable as the prototype grows.

The survivor uses `CharacterBody3D` with `NavigationAgent3D`. The world supplies
a navigation region, while the controller converts right-clicks into world
targets. Selection is signaled by the controller rather than discovered through
global node lookups.

## Planned boundaries

- Managers will own cross-cutting state and expose signals.
- Entities will be assembled from reusable health, movement, combat, inventory,
  job, infection, targeting, and mutation components as those features arrive.
- Age, weapon, zombie, building, research, and resource content will live in
  data files or Godot resources instead of manager conditionals.
- Horde AI will eventually use batched/distance-based updates and pooling, but
  those optimizations are deferred until representative behavior exists.

## Decisions

1. The distributable Godot project is rooted at `codexGamea1/` in this review
   export and can be checked out as a standalone `/codexGamea1` repository.
2. Placeholder primitives and materials are used for the first milestone.
3. No speculative gameplay manager is introduced before a system needs it.
