# RaspAssembly
Set of ARM assembly demos for raspberry pi


## Demos

1. Hello World - simple hello world demo
2. Addition - multiply 2 by -1 and add 1 (output via echo $?)
3. Addition Carry - add two big (64 bit) numbers with carry (output via echi $?) 
4. Upper - convert a string to uppet case
5. UpperFunc - upper realised via func(check upperfunc dir)

## Build and Run
Without make

```yaml
chmod +x build

./build <demo-name>

./bin/<demo-name>
```

With male

```yaml
cd <demo-dir>
make

./<objfile>
```
