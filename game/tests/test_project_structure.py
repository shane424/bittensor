from pathlib import Path


GAME_ROOT = Path(__file__).resolve().parents[1]


def test_project_declares_the_world_prototype_as_main_scene():
    project = (GAME_ROOT / "project.godot").read_text()
    assert 'run/main_scene="res://scenes/world/world_prototype.tscn"' in project
    assert 'renderer/rendering_method="gl_compatibility"' in project


def test_first_milestone_scene_contains_only_expected_gameplay_landmarks():
    scene = (GAME_ROOT / "scenes/world/world_prototype.tscn").read_text()
    for node_name in ("Ground", "NavigationRegion3D", "RTSCamera", "Survivor", "WoodResource"):
        assert f'name="{node_name}"' in scene
    for deferred_system in ("ZombieManager", "ResearchManager", "AgeManager"):
        assert deferred_system not in scene


def test_survivor_uses_navigation_and_explicit_selection():
    survivor = (GAME_ROOT / "scripts/units/survivor.gd").read_text()
    assert "NavigationAgent3D" in survivor
    assert "func set_selected" in survivor
    assert "func move_to" in survivor


def test_required_session_documents_exist():
    for relative_path in ("PROJECT.md", "ROADMAP.md", "TODO.md", "CHANGELOG.md", "docs/architecture.md"):
        assert (GAME_ROOT / relative_path).is_file()
