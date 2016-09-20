# Benchmark Exhaustivity Checking

Scripts for reproducing benchmarks of exhaustivity checking in Dotty and Scala

## Version

Patches are made against following versions:

- Dotty: a062bac
- Scala: 823b2d9

## How to reproduce?

### Prepare Scala

```
git clone git@github.com:scala/scala.git
git checkout -b 823b2d9
git apply ../bench-patmat/scala-823b2d9.patch
sbt compile
sbt dist/mkPack
```

### Prepare Dotty

```
git clone git@github.com:lampepfl/dotty.git
git checkout -b a062bac
git apply ../bench-patmat/dotty-a062bac.patch
sbt compile package
```

### Run Test

First, update the dotty and scala path in the file `run`.

Then, run the tests:

```
bash run | tee log.out
```

Warning: it may take several days to finish!

### Analyze

```
bash analyze log.out .
```

The generated csv files can be used to generate graphs.

