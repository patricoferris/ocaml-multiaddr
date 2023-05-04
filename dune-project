(lang dune 3.4)

(name multiaddr)

(generate_opam_files true)

(source
 (github patricoferris/ocaml-multiaddr))

(license ISC)

(authors "Patrick Ferris")

(maintainers "patrick@sirref.org")

(package
 (name multiaddr)
 (synopsis "Simple address format")
 (description "")
 (depends
  (alcotest :with-test)
  multicodec
  ipaddr
  cstruct))

(using mdx 0.1)
