"""
Configuration for pytest.

This module contains fixtures and configuration for pytest.
"""

import sys
from pathlib import Path

# Add the 'src' directory to the Python path
# This ensures that the 'project_example' package can be imported in tests
src_path = Path(__file__).parent.parent / "src"
sys.path.insert(0, str(src_path))
