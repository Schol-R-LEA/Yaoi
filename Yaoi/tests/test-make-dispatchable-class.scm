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
 (test-group "test basic class creation"
             (let ((cls-0 (make-dispatchable-class
                           (foo bar baz)
                           (methods (quux (display foo))
                                    (zark (display baz))))))
                (test-assert (procedure? cls-0)))))