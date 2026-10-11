# SpecialString #

Ever need a string but also wish it weren't a `String` type? Like if you got some unsafe user input and never want to accidentally put it in a SQL query unsanitized? Of if you got a local ID and didn't want to mix it up with a remote ID?

`SpecialString` achieves just this. In all but name, it acts like a string. However, it's protected by Swift's powerful type system so that it can never be mistaken as something else.



## Premade Special Strings ##

This package contains some premade special strings for common usages:

- `UnsafeUserInput` - Unsafe user input. It must be sanitized before it can be safely used.
- `SanitizedUserInput` - User input which has gone through some process and can now be deemed safe to use.
- `Password` - A password. It must never be serialized as a plaintext string.


### Identifiers ###

Identifiers are very commonly strings, so they are perfect use cases for `SpecialString`! However, because each identifier is inherently tied to the service in which it identifies something, this package does not define any. Instead, you should define a new special type for each remote service, like `LocalImageIdentifier`, `GoogleDriveItemIdentifier`, or `BrowserSessionIdentifier`.



## `EssentiallyAString` ##

> ⚠️ As of version 1.3, this protocol has been moved to [its own package](https://github.com/KyNorthstar/Swift-EssentiallyAString) and exported from this one. It will remain exported from this package until version 2, when it will no longer be exported and you'll have to import it seprately.
>
> That means you can continue to use `EssentallyAString` just by importing `SpecialString` for now, but in the future you'll also have to `import EssentiallyAString` in order to use `EssentiallyAString`.

This package also includes the handy protocol `EssentiallyAString`, which helps you make types which are essentially strings. This greatly improves the ergonomics of `SpecialString`, letting you use it in most of the ways a `String` can be used.

Feel free to use `EssentiallyAString` for other things!
