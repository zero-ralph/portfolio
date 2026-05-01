from setuptools import setup, find_packages

requires = [
    'ruff',
    'detect-secrets'
]

setup(
    name="MTSP",
    version="1.0.0",
    author="Ralph Subrio",
    author_email="ralph.subrio@gmail.com",
    description="Multi Tenant SaaS Portfolio",
    license="BSD",
    packages=find_packages(where="."),
    install_requires=requires,
    entry_points={
    "console_scripts": [
        "app=mtsp.main:run"
    ]
}
)