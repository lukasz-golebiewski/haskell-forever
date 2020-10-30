## haskell-forever
Enter the profiling shell: `nix-shell profiling-shell.nix`

Do the profiling:
`time cabal run haskell-forever-app --enable-profiling --enable-library-profiling -- +RTS -p -hm -l-au -i5 -M32M`

Visualize the results:
`hp2ps -c -b haskell-forever-app.hp`
