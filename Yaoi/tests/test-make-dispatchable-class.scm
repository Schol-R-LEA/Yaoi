#!r6rs

(import
  (rnrs base (6))
  (rnrs io ports (6))
  (srfi 1)               ;; list utils
  (srfi 13)              ;; string utils
  (srfi 14)              ;; charsets
  (srfi 43)              ;; vector utils
  (srfi 88)              ;; keywords
  (srfi 64)              ;; test suite
  (Yaoi))

(define runner (test-runner-simple))

(test-with-runner
 runner
 (test-group
  "test class creation"
  (let ((cls-0 (make-dispatchable-class
                (foo bar baz)
                (methods (quux foo)
                         (zark (begin
                                (display baz)
                                (if (number? baz)
                                  (+ 1 baz)
                                  baz)))))))
    (test-assert (procedure? cls-0))
    (test-group
     "test basic object creation"
     (let ((obj-0 (cls-0 1 2 3))
           (obj-1 (cls-0 'a 'b 'c)))
       (test-assert (procedure? obj-0))
       (test-assert (procedure? obj-1))
       (test-group
        "test method invocation"
        (test-equal 1 (obj-0 'quux))
        (test-equal 4 (obj-0 'zark))
        (test-equal 'a (obj-1 'quux))
        (test-equal 'c (obj-1 'zark))
        (test-group
         "test erroneous method invocation"
         (test-error  (obj-0 'buzz))
         (test-error  (obj-1 'funk)))))))))