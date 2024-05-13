echo "installing poetry / virtualenv from pip on the main python version"
pip install poetry
read -p "Enter your project name: " name
echo "Creating project:"
cd ../
poetry new -n --src $name
cp starter/Dockerfile starter/.pre-commit-config.yaml $name/
cat starter/pyproject.toml >> $name/pyproject.toml
cd $name
poetry config virtualenvs.in-project true
poetry env use 3.11
source .venv/bin/activate
poetry add black ruff pytest pytest-sugar pre-commit coverage ipykernel --group dev
echo ".env" >> .gitignore
echo ".venv/" >> .gitignore
echo "__pycache__/" >> .gitignore

read -p "Now create an empty git repository online and paste the SSH cloning link here: " repo
echo "Setting up git repo"
git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin $repo
git push -u origin main

echo "installing pre-commit"
pre-commit install

