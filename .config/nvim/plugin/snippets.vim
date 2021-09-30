"            _                  _
"  ___ _ __ (_)_ __  _ __   ___| |_ ___
" / __| '_ \| | '_ \| '_ \ / _ \ __/ __|
" \__ \ | | | | |_) | |_) |  __/ |_\__ \
" |___/_| |_|_| .__/| .__/ \___|\__|___/
"             |_|   |_|
"
"
" vim cpp
	let g:cpp_class_scope_highlight = 1
	let g:cpp_class_decl_highlight = 1
	let g:cpp_experimental_simple_template_highlight = 1
	autocmd FileType cpp inoremap <space><space> <esc>/<++><CR>"_c4l
	autocmd FileType cpp inoremap ;hd #include <iostream><CR>using namespace std;<CR><CR>
	autocmd FileType cpp inoremap ;cl class <+> {<CR>public:<CR><++>;<CR>};<CR><++><esc>4k0f+ca<
	autocmd FileType cpp inoremap ;mn <+> main() <CR>{<CR><++>;<CR>};<CR><++><esc>4k0f+ca<

" vim R
	autocmd FileType r inoremap <space><space> <esc>/<++><CR>"_c4l
	autocmd FileType r inoremap ;c <++> <- c(<++>,<++>)<esc>17h"_ca<
	autocmd FileType r inoremap ;i <esc>2li,""<esc>i


" vim matlab/octave
	autocmd FileType matlab inoremap <space><space> <esc>/<++><CR>"_c4l
	autocmd FileType matlab inoremap ;fc function [<+>] = <++>(<++>)<CR><++>;<CR>end<esc>2k0f+ca<
	autocmd FileType matlab inoremap ;fr for <+> = 1 : <++><CR><++>;<CR>end<CR><++><esc>3k0f+ca<
	autocmd FileType matlab inoremap ;if if <+><CR><++>;<CR>end<CR><++><esc>3k0f+ca<
	autocmd FileType matlab inoremap ;o ones(<+>)<esc>2hca<
	autocmd FileType matlab inoremap ;z zeros(<+>)<esc>2hca<
	autocmd FileType matlab inoremap ;e eye(<+>)<esc>2hca<
	autocmd FileType matlab inoremap ;sq sqrt(<+>)<esc>2hca<
	autocmd FileType matlab inoremap ;le length(<+>)<esc>2hca<

" vim latex
	filetype indent on
	let g:tex_flavor='latex'
	highlight MatchParen ctermfg=Black ctermbg=Magenta
	autocmd BufNewFile,BufRead *.tex   setlocal textwidth=79
	autocmd FileType tex inoremap <space><space> <esc>/<++><CR>"_c4l

	" document structure
	autocmd FileType tex inoremap ;sc <CR><CR>%<esc>50a-<esc>o\section{<+>}<CR>%<esc>50a-<esc>o<CR><CR><++><esc>4kf+ca<
	autocmd FileType tex inoremap ;ssc <CR>%<esc>50a-<esc>o\subsection{<+>}<CR>%<esc>50a-<esc>o<CR><++><esc>3kf+ca<
	autocmd FileType tex inoremap ;sssc <CR>%<esc>50a-<esc>o\subsubsection{<+>}<CR>%<esc>50a-<esc>o<CR><++><esc>3kf+ca<
	autocmd FileType tex inoremap ;pr <CR>%<esc>50a-<esc>o\paragraph*{<+>}<CR>%<esc>50a-<esc>o\addcontentsline{toc}{paragraph}{$\quad$<++>}<esc>o<CR><++><esc>4kf+ca<
	autocmd FileType tex inoremap ;npr <esc>vi{y2j0f+"_ca<<esc>p2j0f+ca<
	" autocmd FileType tex inoremap ;ns <CR><CR><CR>%<esc>50a-<esc>o\section*{<+>}<CR>%<esc>50a-<esc>o<CR><CR><++><esc>4kf+ca<
	autocmd FileType tex inoremap ;ns <CR>%<esc>50a-<esc>o\subsection*{<+>}<CR>%<esc>50a-<esc>o<CR><++><esc>3kf+ca<
	" autocmd FileType tex inoremap ;nsss <CR><CR>%<esc>50a-<esc>o\subsubsection*{<+>}<CR>%<esc>50a-<esc>o<CR><++><esc>3kf+ca<

	" environment
	" equation-related
	" single equation
	autocmd FileType tex inoremap ;eq <CR>%<CR>\begin{equation}<CR><++><CR>\end{equation}<CR>%<CR><++><esc>3k0lC<esc>cc
	autocmd FileType tex inoremap ;nl <CR>%<CR>\begin{equation*}<CR><++><CR>\end{equation*}<CR>%<CR><++><esc>3k0lC<esc>cc
	autocmd FileType tex inoremap ;ml <CR>%<CR>\begin{multline}\label{eq:<++>}<CR><++><CR>\\<CR><++><CR>\end{multline}<CR>%<CR><++><esc>6k0f+ca<
	" labeled single equation
	autocmd FileType tex inoremap ;el <CR>%<CR>\begin{equation}\label{eq:<++>}<CR><++><CR>\end{equation}<CR>%<CR><++><esc>4kf+ca<
	" split equation
	autocmd FileType tex inoremap ;es <CR>%<CR>\begin{equation}\label{eq:<++>}<CR>\begin{split}<CR><++> & <++><CR>\\<CR><++> & <++><CR>\end{split}<CR>\end{equation}<CR>%<CR><++><esc>8kf+ca<
	" subequations
	autocmd FileType tex inoremap ;se <CR>%<CR>\begin{subequations}\label{eq:<++>}<CR>\begin{align}<CR><++> & <++> \label{eq:<++>_1}<CR>\\<CR><++> & <++> \label{eq:<++>_2}<CR>\end{align}<CR>\end{subequations}<CR>%<CR><++><esc>8kf+ca<
	" equation with cases
	autocmd FileType tex inoremap ;cs <CR>%<CR>\begin{equation}\label{eq:<++>}<CR><++>=\begin{cases}<CR><++> & <++>,<CR>\\<CR><++> & <++>,<CR>\end{cases}<CR>\end{equation}<CR>%<CR><++><esc>8kf+ca<
	" this one offers more flexibilities than cases
	autocmd FileType tex inoremap ;al <CR>%<CR>\begin{align}\label{eq:<++>}<CR><++>=\left\{<CR>\begin{array}{rr}<CR><++> & <++>,<CR>\\<CR><++> & <++>,<CR>\end{array}<CR><BS>\right.<CR>\end{align}<CR>%<CR><++><esc>10kf+ca<

	"other environments
	autocmd FileType tex inoremap ;th <CR>%<CR>\begin{theorem}[<++>]\label{thm:<++>}<CR><++><CR>\end{theorem}<CR>%<CR><++><esc>4kf+ca<
	"autocmd FileType tex inoremap ;th <CR>%<CR>\begin{thmEv}[<++>]\label{thm:<++>}<CR><++><CR>\end{thmEv}<CR>%<CR><++><esc>4kf+ca<
	autocmd FileType tex inoremap ;lm <CR>%<CR>\begin{lemma}[<++>]\label{lem:<++>}<CR><++><CR>\end{lemma}<CR>%<CR><++><esc>4kf+ca<
	autocmd FileType tex inoremap ;cr <CR>%<CR>\begin{corollary}[<++>]\label{cor:<++>}<CR><++><CR>\end{corollary}<CR>%<CR><++><esc>4kf+ca<
	autocmd FileType tex inoremap ;pp <CR>%<CR>\begin{proposition}[<++>]\label{pp:<++>}<CR><++><CR>\end{proposition}<CR>%<CR><++><esc>4kf+ca<
	autocmd FileType tex inoremap ;rm <CR>%<CR>\begin{remark}\label{rem:<++>}<CR><++><CR>\end{remark}<CR>%<CR><++><esc>4kf+ca<
	autocmd FileType tex inoremap ;df <CR>%<CR>\begin{definition}\label{def:<++>}<CR><++><CR>\end{definition}<CR>%<CR><++><esc>4kf+ca<
	"autocmd FileType tex inoremap ;df <CR>%<CR>\begin{definition*}[<++>]<CR><++><CR>\end{definition*}<CR>%<CR><++><esc>4kf+ca<
	autocmd FileType tex inoremap ;nt <CR>%<CR>\begin{notation*}[<++>]<CR><++><CR>\end{notation*}<CR>%<CR><++><esc>4kf+ca<
	autocmd FileType tex inoremap ;fe <CR>%<CR>\begin{example}\label{eg:<++>}<CR><++><CR>\end{example}<CR>%<CR><++><esc>4kf+ca<
	autocmd FileType tex inoremap ;pf \begin{proof}\label{pf:<++>}<CR><++><CR>\end{proof}<CR>%<CR><++><esc>4kf+ca<
	autocmd FileType tex inoremap ;fg %<CR>\begin{figure}[<+>]<CR>\centering<CR>\includegraphics[width=<++>]{<++>}<CR>\caption{<++>}<CR>\label{fig:<++>}<CR>\end{figure}<CR>%<CR><++><esc>7kf+ca<
	autocmd FileType tex inoremap ;sf %<CR>\begin{figure}[<+>]<CR>\centering<CR>\begin{subfigure}{0.4\textwidth}<CR>\includegraphics[width=\textwidth]{<++>}<CR>\caption{<++>}<CR>\label{fig:<++>-1}<CR>\end{subfigure}<CR>~<CR>\begin{subfigure}{0.4\textwidth}<CR>\includegraphics[width=\textwidth]{<++>}<CR>\caption{<++>}<CR>\label{fig:<++>-2}<CR>\end{subfigure}<CR>\caption{<++>}<CR>\label{fig:<++>}<CR>\end{figure}<CR>%<CR><++><esc>17kf+ca<
	autocmd FileType tex inoremap ;it %<CR>\begin{itemize}<CR>\item<space><+><CR>\item<space><++><CR>\item<space><++><CR>\end{itemize}<CR>%<CR><++><esc>5kf+ca<
	autocmd FileType tex inoremap ;en %<CR>\begin{enumerate}<CR>\item<space><+><CR>\item<space><++><CR>\item<space><++><CR>\end{enumerate}<CR>%<CR><++><esc>5kf+ca<
	autocmd FileType tex inoremap ;di %<CR>\begin{dingautolist}{202}<CR>\item<space><+><CR>\item<space><++><CR>\item<space><++><CR>\end{dingautolist}<CR>%<CR><++><esc>5kf+ca<
	autocmd FileType tex inoremap ;dn %<CR>\begin{dinglist}{70}<CR>\item<space><+><CR>\item<space><++><CR>\item<space><++><CR>\end{dinglist}<CR>%<CR><++><esc>5kf+ca<
	autocmd FileType tex inoremap ;bx <CR><CR>\vspace{1mm}<CR>\noindent\fbox{<CR>\parbox{0.98\textwidth}{<CR>\vspace{2mm}<CR><+><CR>\vspace{2mm}<CR>}<CR>}<CR>\vspace{1mm}<CR><CR><++><esc>6k0f+ca<
	autocmd FileType tex inoremap ;mt %<CR>\begin{minted}[frame=single]{cpp}<CR><++><CR>\end{minted}<CR>%<CR><++><esc>3k0f+ca<

	" figure environments

	" single tikzpicture
	autocmd FileType tex inoremap ;tk %<CR>\begin{figure}[tbp]<CR>\centering<CR>\begin{tikzpicture}<CR><++><CR>\end{tikzpicture}<CR>\caption{<++>}<CR>\label{fig:<++>}<CR>\end{figure}<CR>%<CR><++><esc>6k0f+ca<

	" two horizontally aligned tikzpictures
	autocmd FileType tex inoremap ;ttk %<CR>\begin{figure}[tbp]<CR>\centering<CR>\begin{subfigure}{0.4\textwidth}<CR>\centering<CR>\begin{tikzpicture}<CR><++><CR>\end{tikzpicture}<CR>\caption{<++>}<CR>\label{fig:+++-1}<CR>\end{subfigure}<CR>%\hfil<CR>\begin{subfigure}{0.4\textwidth}<CR>\centering<CR>\begin{tikzpicture}<CR><++><CR>\end{tikzpicture}<CR>\caption{<++>}<CR>\label{fig:+++-2}<CR>\end{subfigure}<CR>\caption{<++>}<CR>\label{fig:+++}<CR>\end{figure}<CR>%<CR><++><esc>18kf+ca<


	" text command
	autocmd FileType tex inoremap ;tb \textbf{<+>}<++><esc>6hca<
	autocmd FileType tex inoremap ;tx \text{<+>}<++><esc>6hca<
	autocmd FileType tex inoremap ;em \emph{<+>}<++><esc>6hca<
	autocmd FileType tex inoremap ;rf \cref{<+>}<++><esc>6hca<
	autocmd FileType tex inoremap ;rr \crefrange{<+>}{<++>}<++><esc>12hca<
	autocmd FileType tex inoremap ;ct \cite<+>{<++>}<++><esc>11hca<
	autocmd FileType tex inoremap ;ag \langle<space><+>\rangle<space><++><esc>13hca<
	" autocmd FileType tex inoremap ;rd {\color{red}<space><+>}<++><esc>6hca<
	autocmd FileType tex inoremap ;rd {\color{red}<space><+>}<++><esc>6hca<
	" autocmd FileType tex inoremap ;bl {\color{blue}<space><+>}<++><esc>6hca<
	autocmd FileType tex inoremap ;bl {\color{blue}<space><+>}<++><esc>6hca<
	" autocmd FileType tex inoremap ;gr {\color{green}<space><+>}<++><esc>6hca<
	autocmd FileType tex inoremap ;gr {\color{green}<space><+>}<++><esc>6hca<
	autocmd FileType tex inoremap ;tw \textwidth

	" math command
	autocmd FileType tex inoremap ;fc \frac{<+>}{<++>}<++><esc>12hca<
	autocmd FileType tex inoremap ;bs \boldsymbol{<+>}<++><esc>6hca<
	autocmd FileType tex inoremap ;bb \mathbb{<+>}<++><esc>6hca<
	autocmd FileType tex inoremap ;ca \mathcal{<+>}<++><esc>6hca<
	autocmd FileType tex inoremap ;bm \bm{\mathrm{<+>}}<++><esc>7hca<
	autocmd FileType tex inoremap ;pt \partial
	autocmd FileType tex inoremap ;ld \lambda
	autocmd FileType tex inoremap ;cb \cbr{<+>}<++><esc>6hca<
	autocmd FileType tex inoremap ;sb \sbr{<+>}<++><esc>6hca<
	autocmd FileType tex inoremap ;pb \del[0]{<+>}<++><esc>6hca<
	autocmd FileType tex inoremap ;ba \bar{<+>}<++><esc>6hca<
	autocmd FileType tex inoremap ;tl \tilde{<+>}<++><esc>6hca<
	autocmd FileType tex inoremap ;fa \forall<space>
	"autocmd FileType tex inoremap ;ex \exists<space>
	autocmd FileType tex inoremap ;nm \norm{<+>}<++><esc>6hca<
	autocmd FileType tex inoremap ;tr ^\intercal<space>
	autocmd FileType tex inoremap ;cd \cdot<space>
	autocmd FileType tex inoremap ;nb \nabla<space>
	autocmd FileType tex inoremap ;dt \delta<space>
	autocmd FileType tex inoremap ;Dt \delta<space>
	autocmd FileType tex inoremap ;ep \epsilon<space>
	autocmd FileType tex inoremap ;jp \llbracket<space><+>\rrbracket<esc>11hca<
	autocmd FileType tex inoremap ;av \lcurlbrace<space><+>\rcurlbrace<esc>13hca<
	autocmd FileType tex inoremap ;cc \item[$\circ$]<space>

	" beamer environments and commands
	autocmd FileType tex inoremap ;fm \begin{frame}<CR>\frametitle{<++>}<CR><++><CR>\end{frame}<esc>2k0f+ca<
	autocmd FileType tex inoremap ;bk \begin{block}{<++>}<CR><++><CR>\end{block}<esc>2k0f+ca<
	autocmd FileType tex inoremap ;abk \begin{alertblock}{<++>}<CR><++><CR>\end{alertblock}<esc>2k0f+ca<

	" others
	autocmd FileType tex inoremap ;rw %<CR>\begin{rewind}<CR><++><CR>\end{rewind}<CR>%<CR><++><esc>3k0f+ca<
	autocmd FileType tex inoremap ;ex %<CR>\begin{extra}{<++>}<CR><++><CR>\end{extra}<CR>%<CR><++><esc>4k0f+ca<
	autocmd FileType tex inoremap ;cm %<CR>\begin{cmt}{<++>}<CR><++><CR>\end{cmt}<CR>%<CR><++><esc>4k0f+ca<
	autocmd FileType tex inoremap ;cn %<CR>\setcounter{section}{<++>}<CR>\setcounter{theorem}{<++>}<CR>%<CR><++><esc>3k0f+ca<
	autocmd FileType tex nnoremap ;cl jddkyyp:s/./-/g<CR>0i%<esc>lxyykkpkdd2j:noh<CR>
	autocmd FileType tex inoremap ;qt ``<+>''<++><esc>7hca<



" vim web: html
	autocmd FileType html inoremap <space><space> <esc>/<++><CR>"_c4l
	autocmd FileType html inoremap ;lk <a href="<++>"><++></a><esc>2Faf+"_ca<

" vim markdown
	let g:markdown_folding = 1
	autocmd FileType markdown inoremap <space><space> <esc>/<++><CR>"_c4l
	autocmd FileType markdown inoremap ;lk [<+>](<++>)<esc>8hca<
	"autocmd FileType markdown noremap ;cc <esc>0f[lrx$a<esc>j$
	"autocmd FileType markdown noremap ;nc o<esc>i-<space>[<space>]<space>
	"autocmd FileType markdown noremap ;uu <esc>0f[lr<space>$a<esc>j$
	autocmd FileType markdown noremap <space> za

" vim orgmode
	let maplocalleader = ';'

" vim beancount

	let b:beancount_root = '$HOME/Projects/Miscellany/zahle-bohne/accounts.beancount'
	autocmd FileType beancount setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd FileType beancount setlocal autoindent

	" macros
	autocmd FileType beancount inoremap <space><space> <esc>/<+><CR>"_c3l
	autocmd FileType beancount inoremap . .<C-\><C-O>:AlignCommodity<CR>
	" autocmd FileType beancount inoremap <Tab> <c-x><c-o>

	" groceries
	autocmd FileType beancount inoremap ;gr <CR>2021-07-<+><space>*<space>"<+>"<CR><space><space>Expenses:Food:Groceries<space><+> CAD<CR>Liabilities:CreditCard:CA:VisaCIBCaventura<CR><+><esc>3k0/<+><CR>"_c3l
	autocmd FileType beancount inoremap ;dl <CR>2021-07-<+><space>*<space>"Dollarama"<CR><space><space>Expenses:Food:Groceries<space><+> CAD<CR>Liabilities:CreditCard:CA:VisaCIBCaventura<CR><+><esc>3k0/<+><CR>"_c3l
	autocmd FileType beancount inoremap ;zr <CR>2021-07-<+><space>*<space>"Zehrs"<CR><space><space>Expenses:Food:Groceries<space><+> CAD<CR>Liabilities:CreditCard:CA:VisaCIBCaventura<CR><+><esc>3k0/<+><CR>"_c3l
	autocmd FileType beancount inoremap ;sb <CR>2021-07-<+><space>*<space>"Sobeys"<CR><space><space>Expenses:Food:Groceries<space><+> CAD<CR>Liabilities:CreditCard:CA:VisaCIBCaventura<CR><+><esc>3k0/<+><CR>"_c3l
	autocmd FileType beancount inoremap ;7e <CR>2021-07-<+><space>*<space>"7-11"<CR><space><space>Expenses:Food:Groceries<space><+> CAD<CR>Liabilities:CreditCard:CA:VisaCIBCaventura<CR><+><esc>3k0/<+><CR>"_c3l
	autocmd FileType beancount inoremap ;wm <CR>2021-07-<+><space>*<space>"Walmart"<CR><space><space>Expenses:Food:Groceries<space><+> CAD<CR>Liabilities:CreditCard:CA:VisaCIBCaventura<CR><+><esc>3k0/<+><CR>"_c3l
	autocmd FileType beancount inoremap ;ws <CR>2021-07-<+><space>*<space>"Wholesale"<CR><space><space>Expenses:Food:Groceries<space><+> CAD<CR>Liabilities:CreditCard:CA:MastercardCapitalOne<CR><+><esc>3k0/<+><CR>"_c3l
	autocmd FileType beancount inoremap ;cs <CR>2021-07-<+><space>*<space>"Costco"<CR><space><space>Expenses:Food:Groceries<space><+> CAD<CR>Liabilities:CreditCard:CA:MastercardCapitalOne<CR><+><esc>3k0/<+><CR>"_c3l
	autocmd FileType beancount inoremap ;cft <CR>2021-07-<+><space>*<space>"Canadian Tire"<CR><space><space>Expenses:Housing:Furniture<space><+> CAD<CR>Liabilities:CreditCard:CA:VisaCIBCaventura<CR><+><esc>3k0/<+><CR>"_c3l
	autocmd FileType beancount inoremap ;ckt <CR>2021-07-<+><space>*<space>"Canadian Tire"<CR><space><space>Expenses:Housing:Kitchen<space><+> CAD<CR>Liabilities:CreditCard:CA:VisaCIBCaventura<CR><+><esc>3k0/<+><CR>"_c3l
	autocmd FileType beancount inoremap ;tt <CR>2021-07-<+><space>*<space>"T&T"<CR><space><space>Expenses:Food:Groceries<space><+> CAD<CR>Liabilities:CreditCard:CA:VisaCIBCaventura<CR><+><esc>3k0/<+><CR>"_c3l

	" restaurants
	autocmd FileType beancount inoremap ;rt <CR>2021-07-<+><space>*<space>"<+>"<CR><space><space>Expenses:Food:Restaurant<space><+> CAD<CR>Liabilities:CreditCard:CA:VisaCIBCaventura<CR><+><esc>3k0/<+><CR>"_c3l
	autocmd FileType beancount inoremap ;md <CR>2021-07-<+><space>*<space>"McDonald"<CR><space><space>Expenses:Food:Restaurant<space><+> CAD<CR>Liabilities:CreditCard:CA:VisaCIBCaventura<CR><+><esc>3k0/<+><CR>"_c3l
	autocmd FileType beancount inoremap ;cd <CR>2021-07-<+><space>*<space>"C&D"<CR><space><space>Expenses:Food:Restaurant<space><+> CAD<CR>Liabilities:CreditCard:CA:VisaCIBCaventura<CR><+><esc>3k0/<+><CR>"_c3l

	" transport
	autocmd FileType beancount inoremap ;tr <CR>2021-07-<+><space>*<space>"<+>"<CR><space><space>Expenses:Transport:Taxi<space><+> CAD<CR>Liabilities:CreditCard:CA:VisaCIBCaventura<CR><+><esc>3k0/<+><CR>"_c3l

	" credit card payments
	autocmd FileType beancount inoremap ;1c <CR>2021-07-<+><space>*<space>"CreditCard Payment"<CR><space><space>Assets:Bank:CA:CIBC:Savings<space><+> CAD<CR>Liabilities:CreditCard:CA:VisaCIBCaventura<CR><+><esc>3k0/<+><CR>"_c3l
	autocmd FileType beancount inoremap ;2c <CR>2021-07-<+><space>*<space>"CreditCard Payment"<CR><space><space>Assets:Bank:CA:CIBC:Savings<space><+> CAD<CR>Liabilities:CreditCard:CA:MastercardCapitalOne<CR><+><esc>3k0/<+><CR>"_c3l

	" other stuff
	autocmd FileType beancount inoremap ;bk <CR>2021-07-<+><space>*<space>"<+>"<CR><space><space>Expenses:Collection:Books<space><+> CAD<CR>Liabilities:CreditCard:CA:VisaCIBCaventura<CR><+><esc>3k0/<+><CR>"_c3l
