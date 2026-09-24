# AGES OF THE DEAD

## Project summary

**Genre:** Survival / base building / action strategy / roguelite
**Platform:** PC / Steam
**Engine:** Godot 4.x
**Camera:** Isometric, angled top-down 3D

Humanity begins with primitive tools and must advance from the Prehistoric Age
through the Stone and Bronze Ages while the undead develop counters to the
player's technology. The full vision spans later historical eras, but the MVP
is deliberately limited to those first three ages.

## Design principles

- Build one major feature at a time and preserve working systems.
- Keep content data-driven and gameplay code reusable.
- Prefer signals and events to tightly coupled manager references.
- Keep survivor simulation lightweight until the core loop is fun.
- Design zombie architecture for large hordes, without premature optimization.
- Use placeholder assets until gameplay has been validated.

## Core loop

Explore → gather → build → research → prepare → survive → recover → advance.

## First playable milestone

The smallest playable milestone is a single flat 3D map with an isometric RTS
camera, one selectable and movable survivor, and one visible wood resource
node. It does not include gathering, combat, zombies, research, crafting, age
progression, or other advanced systems.

## MVP boundary

The MVP will ultimately include one biome, Prehistoric/Stone/Bronze progression,
basic settlement construction, and Walker/Runner/Crawler/Crusher/Bronze Husk
enemies. New eras and civilization variants remain post-MVP work.
