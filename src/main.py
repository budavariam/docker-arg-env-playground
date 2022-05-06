import os

vars = [
    "ARG_WITH_DEFAULT",
    "ARG_WITHOUT_DEFAULT",
    "ARG_UNSET_OUTSIDE",
    "ENV_WITH_DEFAULT",
    "ENV_ARG_WITH_DEFAULT",
    "ENV_ARG_WITHOUT_DEFAULT",
    "ENV_ARG_UNSET_OUTSIDE",
    "ENV_ARG_UNSET_OUTSIDE_WITH_DEFAULT",
    "EXTERNAL_ENV_ENV"
]

print(f"""
- *empty string*: value is empty string
- -1: env variable not found
-  [0-9]: value set in from Dockerfile
- 1[0-9]: value from build arguments
- 2[0-9]: value set in external environment e.g in docker-compose

ENV vars of running app:
""")

for v in vars:
    print(f"{v}:", os.getenv(v, -1))
