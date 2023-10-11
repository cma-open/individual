"""Common code constants.

.. module: definitions
Generates main package name and directory for use by other modules.

"""

from importlib.resources import files
from pathlib import Path

# Set the package name
PACKAGE = __package__

# Set the directory paths relative to this file
# Note - only parent package dir is reliable for use in both user and dev installs
# repo/src/package (dev, editable) and site-packages/package (full install)
PACKAGE_DIR = files(PACKAGE)
# Root dir gives src (dev, editable) and site-packages (full install)
ROOT_DIR = Path(files(PACKAGE)).parent
RESOURCES_DIR = ROOT_DIR / PACKAGE / "resources"
