# Configure without rebuilding

The same image should run differently in dev vs prod. **Environment variables**
(`-e KEY=value`) are the standard way to feed config into a container at run
time. You'll set one and read it back from inside.
