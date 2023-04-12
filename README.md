# doom

+ [ ] Устанавливаем [[https://www.gnu.org/software/emacs/][Emacs]] версии 28
+ [ ] Устанавилваем [[https://chocolatey.org/install][chocolatey]]
  + [ ] Устанавливаем fd и ripgrep
    #+begin_src powershell
    choco install fd
    choco install ripgrep
    #+end_src
+ [ ] Клонируем репозитории doom-emacs и my doom
    #+begin_src powershell
    cd ~
    git clone --depth 1 https://github.com/doomemacs/doomemacs .config/emacs/
    cd ..
    git clone git@github.com:kaptoxa/doom.git doom/
    #+end_src
+ [ ] Инсталируем doom
    #+begin_src powershell
    ./emacs/bin/doom install
    ./emacs/bin/doom sync
    #+end_src
