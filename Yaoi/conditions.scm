#!r6rs

(library
 (Yaoi conditions)
 (export
  &invalid-message-violation make-invalid-message-violation invalid-message-violation?)

 (import
   (rnrs base (6))
   (rnrs exceptions (6))
   (rnrs conditions (6))
   (rnrs records syntactic (6))
   (Scheme-Exception-Utils error-reporting))


 (define-condition-type &invalid-message-violation
   &lexical
   make-invalid-message-violation invalid-message-violation?))
