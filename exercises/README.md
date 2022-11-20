# Exercises #

This will contain some notes and codes done to study haskell.

## Summary ##

- [Exercises](#exercises)
  - [Summary](#summary)
  - [Order to read](#order-to-read)
    - [Basics](#basics)
      - [Function define](#function-define)
      - [Generic](#generic)
    - [Recursion](#recursion)
    - [Abstract Datatypes](#abstract-datatypes)
    - [Pattern Matching](#pattern-matching)
  - [References](#references)

## Order to read ##

Is recommended use [GHCI](https://downloads.haskell.org/ghc/latest/docs/users_guide/gchi.html) to run those codes.

### Basics ###

- [Basics](./Basics.hs)

#### Function define ####

When you define an function in haskell will by inferred an type.

```haskell
double a = a * 2
```

If you use :t to see the type of this function o GHCI you will have:

```haskell
double :: Num a => a -> a
```

Where a is an [Generic](#generic)

#### Generic ####

Is an abstraction that allows you work in an large class of datatype such as Num.

### Recursion ###

### Abstract Datatypes ###

### Pattern Matching ###

## References ##

- [GHCI](https://downloads.haskell.org/ghc/latest/docs/users_guide/gchi.html) <https://downloads.haskell.org/ghc/latest/docs/users_guide/gchi.html>
