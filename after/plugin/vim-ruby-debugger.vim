let g:ruby_debugger_default_script = "bin/rails server"


noremap <f5> :Rdebugger<cr>
noremap <s-f5> :Rdebugger<space>
noremap <c-f5> :RdbStop<cr>
noremap <f6> :RdbEval<space>
noremap <f7> :RdbCond<space>

function! Rdb(function)
    call ruby_debugger#load_debugger()
    execute "call g:RubyDebugger." . a:function . "()"
endfunction

noremap <silent> <leader>dd :call Rdb("toggle_breakpoint")<cr>
noremap <silent> <leader>dn :call Rdb("next")<cr>
noremap <silent> <leader>ds :call Rdb("step")<cr>
noremap <silent> <leader>dc :call Rdb("continue")<cr>
