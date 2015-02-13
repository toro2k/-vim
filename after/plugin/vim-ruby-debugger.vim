noremap <f5> :Rdebugger<cr>
noremap <s-f5> :Rdebugger<space>
noremap <c-f5> :RdbStop<cr>
noremap <f6> :RdbEval<space>
noremap <f7> :RdbCond<space>

let g:ruby_debugger_default_script = "bin/rails server"
