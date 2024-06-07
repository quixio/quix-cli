{% include-markdown './list.gen.md' %}

## Example Usage

When you enter the command without any options:

```
$ quix local applications list
```

A table containing all your local applications is printed:

```
ApplicationId                  | Name                           | Language | Dockerfile | RunEntryPoint | Default File    
-------------------------------|--------------------------------|----------|------------|---------------|-----------------
Event Detection Transformation | Event Detection Transformation | Python   | dockerfile | main.py       | quix_function.py
Starter Source                 | Starter Source                 | Python   | dockerfile | main.py       | main.py         
```