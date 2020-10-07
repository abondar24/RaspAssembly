# RaspAssembly
Set of ARM assembly demos for raspberry pi

Based on book "Raspberry PI Assembly Language Programming"

## Demos

1. Hello World - simple hello world demo(use build script)
2. Addition - multiply 2 by -1 and add 1 (output via echo $?) (use build  script)
3. Addition Carry - add two big (64 bit) numbers with carry (output via echi $?) (use build script) 
4. Upper - convert a string to uppet case (use build script)
5. UpperFunc - upper realised via func(use make in upperfunc dir)
6. Multiplication - demo mul instructions usage (use make in mult dir)
7. Matrix Mult - multiply two 3x3 matrixes using accumulation (use gccBuild script)

## Build and Run
With build

```yaml
chmod +x build

./build <demo-name>

./bin/<demo-name>
```

With make

```yaml
cd <demo-dir>
make

./<objfile>
```

With gccBuild

```
chmod +x gccBuild

./gccBuild <demo-name>
```
