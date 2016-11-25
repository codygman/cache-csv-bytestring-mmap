# About

An attempt to use mmap's to almost instantly serialize/deserialize Haskell records containing not only conventionally Storable types such as Int, Double, or other bounded primitives but also ByteString's.

# Current Status

Stuck on the following error:

```
app/Main.hs:19:10: error: …
    • No instance for (GStorable (V.Vector Word8))
        arising from a use of ‘Foreign.Storable.Generic.Internal.$dmgsizeOf’
    • In the expression: Foreign.Storable.Generic.Internal.$dmgsizeOf
      In an equation for ‘gsizeOf’:
          gsizeOf = Foreign.Storable.Generic.Internal.$dmgsizeOf
      In the instance declaration for ‘GStorable Person’
app/Main.hs:19:10: error: …
    • No instance for (GStorable (V.Vector Word8))
        arising from a use of ‘Foreign.Storable.Generic.Internal.$dmgalignment’
    • In the expression:
        Foreign.Storable.Generic.Internal.$dmgalignment
      In an equation for ‘galignment’:
          galignment = Foreign.Storable.Generic.Internal.$dmgalignment
      In the instance declaration for ‘GStorable Person’
app/Main.hs:19:10: error: …
    • No instance for (GStorable (V.Vector Word8))
        arising from a use of ‘Foreign.Storable.Generic.Internal.$dmgpeekByteOff’
    • In the expression:
        Foreign.Storable.Generic.Internal.$dmgpeekByteOff
      In an equation for ‘gpeekByteOff’:
          gpeekByteOff = Foreign.Storable.Generic.Internal.$dmgpeekByteOff
      In the instance declaration for ‘GStorable Person’
app/Main.hs:19:10: error: …
    • No instance for (GStorable (V.Vector Word8))
        arising from a use of ‘Foreign.Storable.Generic.Internal.$dmgpokeByteOff’
    • In the expression:
        Foreign.Storable.Generic.Internal.$dmgpokeByteOff
      In an equation for ‘gpokeByteOff’:
          gpokeByteOff = Foreign.Storable.Generic.Internal.$dmgpokeByteOff
      In the instance declaration for ‘GStorable Person’
Compilation failed.
```

I believe that even though the V.Vector is already Storable, the Generics machinery does not know/care and only tries to derive a Storable of (V.Vector Word8) and then doesn't find one in the derive-storable package.

I'm currently unsure of how I could add the ability to allow derive-storable to work with (V.Vector Word8).
