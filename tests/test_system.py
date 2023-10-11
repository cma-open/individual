"""Test for system module."""

from individual.system import hello_world

def test_hello_world():
    """Test for helow world function."""
    output = hello_world()
    assert output == "hello world"
