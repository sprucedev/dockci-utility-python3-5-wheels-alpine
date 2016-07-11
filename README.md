# DockCI Utility: Python 3.5 Wheels
DockCI premade utility to build wheels for Python 3.5

## Usage
- Add a utility project into DockCI
    - Use this git repository as the repo
    - Set the slug to something like `python3-5-wheels-alpine`
    - Set the name to something like `Python 3.5 Wheels Alpine`
- Manually create a build
    - Use the lastest version as the git reference
- Modify your `dockci.yaml`:
```
utilities:
  - name: python3-5-wheels-alpine
    input:
      - requirements.txt /work/requirements.txt
      - test-requirements.txt /work/test-requirements.txt
    command: pip wheel -r requirements.txt -r test-requirements.txt
    output:
      - from: /work/wheelhouse
        to: util
```
- Modify your `Dockerfile`:
```
ADD requirements.txt /code/requirements.txt
ADD test-requirements.txt /code/test-requirements.txt
ADD ./util/wheelhouse /code/wheelhouse
RUN pip install --use-wheel --no-index --find-links=wheelhouse -r requirements.txt -r test-requirements.txt
```
