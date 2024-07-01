
from jupyter_server.auth import passwd
from jupyter_server.auth.identity import PasswordIdentityProvider



c.ServerApp.allow_remote_access = True
c.ServerApp.allow_origin = '*'
c.ServerApp.root_dir = "/mnt/Jupyter/Projects"

PasswordIdentityProvider.hashed_password = passwd('changeme')

if PasswordIdentityProvider.hashed_password is not None:
    print("Password successfully set.")
else:
    print("Password is not set.")
