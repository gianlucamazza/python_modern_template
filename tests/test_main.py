"""
Tests for the main module.

This module contains unit tests for the main functionality
of the Python Modern Template.
"""

import unittest

from python_modern_template import main


class TestMain(unittest.TestCase):
    """Test case for the main module."""

    def test_run_returns_dict(self) -> None:
        """Test that run() returns a dictionary."""
        result = main.run()
        self.assertIsInstance(result, dict)

    def test_run_returns_success_status(self) -> None:
        """Test that run() returns a success status."""
        result = main.run()
        self.assertEqual(result["status"], "success")

    def test_run_includes_message(self) -> None:
        """Test that run() includes a message in the result."""
        result = main.run()
        self.assertIn("message", result)
        self.assertIsInstance(result["message"], str)
        self.assertGreater(len(result["message"]), 0)


if __name__ == "__main__":
    unittest.main()
