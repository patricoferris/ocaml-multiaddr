ocaml-multiaddr
---------------

`Multiaddr` allow for the encoding of well-established network protocols.

```ocaml
# let addr = "/ip4/127.0.0.1/udp/1234";;
val addr : string = "/ip4/127.0.0.1/udp/1234"
# let t = Multiaddr.of_string addr |> get_ok;;
val t : Multiaddr.t = <abstr>
# let s = Multiaddr.to_string t;;
val s : string = "/ip4/127.0.0.1/udp/1234"
# let c = Multiaddr.to_cstruct t;;
val c : Cstruct.t = {Cstruct.buffer = <abstr>; off = 0; len = 9}
# Cstruct.hexdump c;;
04 7f 00 00 01 91 02 04  d2
- : unit = ()
```

It also supports encapsulating and decapsulating `Multiaddr.t`.

```ocaml
# let addr = Multiaddr.of_string_exn "/ip4/127.0.0.1/udp/1234";;
val addr : Multiaddr.t = <abstr>
# let addr = Multiaddr.(encapsulate addr @@ of_string_exn "/sctp/5678");;
val addr : Multiaddr.t = <abstr>
# Multiaddr.to_string addr;;
- : string = "/ip4/127.0.0.1/udp/1234/sctp/5678"
# let addr = Multiaddr.(decapsulate addr @@ of_string_exn "/udp/1234");;
val addr : Multiaddr.t option = Some <abstr>
# Multiaddr.to_string (Option.get addr);;
- : string = "/ip4/127.0.0.1"
```