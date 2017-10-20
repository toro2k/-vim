let current_dir = getcwd()

while current_dir !=# '/'
    if filereadable(current_dir . '/init.lua') &&
     \ filereadable(current_dir . '/depends.txt')
        " I guess I'm inside a minetest mod project
        set noexpandtab
        set tabstop=4
        break
    endif
    let current_dir = simplify(current_dir . '/..')
endwhile
