# SimpleRene 

SimpleRene is a fork of [Magritte](https://github.com/magritte-metamodel/magritte), with the only purpose of making it 
lighter and easier to be used on Pharo.  
Thanks to all Magritte contributors :)

[![Spec-dev](https://github.com/pharo-contributions/SimpleRene/actions/workflows/test.yml/badge.svg)](https://github.com/pharo-contributions/SimpleRene/actions/workflows/test.yml)

Most applications consist of a big number of model- or so called domain-objects. Building different views, editors, 
and reports; querying, validating and storing those objects is very repetitive and error-prone, if an object changes 
its shape frequently.

SimpleRene is a fully dynamic meta-description framework that helps to solve those problems, while keeping the full 
power with the programmer in all aspects. Moreover since Magritte is described in itself, you can let your users 
modify the meta-world and add their own fields and forms without writing a single line of code.

### Installation
```smalltalk
Metacello new
	baseline: 'SimpleRene';
	repository: 'github://pharo-contributions/SimpleRene';
	load
```

### Add as a project dependency

In you project Baseline or Configuration definition, add to the spec:

```smalltalk
spec 
	baseline: 'SimpleRene' 
	with: [
		spec
			repository: 'github://pharo-contributions/SimpleRene:v1.0.0'; 
			loads: #(Core) ]; 
```

This snippet uses `v1.0.0` release version, remember to change the release version to your needs. 
See `BaselineOfSimpleRene` for other groups to load beside of 'Core'.
