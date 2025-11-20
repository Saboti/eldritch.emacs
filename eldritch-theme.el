;;; mein-eldritch-theme.el --- Custom theme based on eldritch -*- lexical-binding: t; -*-

(deftheme mein-eldritch
  "A theme inspired by eldritch.")

(let ((class '((class color) (min-colors 89)))
      ;; Official Eldritch Color Palette (aligned with Neovim theme)
      (eld-bg            "#212337")  ; Sunken Depths Grey - Background
      (eld-bg-dark       "#171928")  ; Darker background variant
      (eld-bg-alt        "#323449")  ; Shallow Depths Grey - Current Line
      (eld-bg-highlight  "#292e42")  ; Highlight background
      (eld-base0         "#212337")  ; Sunken Depths Grey (darker variant)
      (eld-base1         "#323449")  ; Shallow Depths Grey
      (eld-base2         "#3d3f54")  ; Slightly lighter than current line
      (eld-base3         "#494c63")  ; Even lighter for borders
      (eld-terminal-black "#414868") ; Terminal black
      (eld-fg            "#ebfafa")  ; Lighthouse White - Foreground
      (eld-fg-dark       "#ABB4DA")  ; Darker foreground variant
      (eld-fg-gutter     "#3b4261")  ; Gutter foreground
      (eld-fg-gutter-light "#7081d0") ; Light gutter foreground
      (eld-red           "#f16c75")  ; R'lyeh Red - Error
      (eld-orange        "#f7c67f")  ; Dreaming Orange
      (eld-yellow        "#f1fc79")  ; Gold of Yuggoth
      (eld-dark-yellow   "#c0c95f")  ; Darker yellow variant (from spec)
      (eld-green         "#37f499")  ; Great Old One Green - Primary
      (eld-bright-green  "#69F8B3")  ; Bright green (ANSI)
      (eld-dark-green    "#33C57F")  ; Darker green for hints (from spec)
      (eld-cyan          "#04d1f9")  ; Watery Tomb Blue - Secondary
      (eld-bright-cyan   "#66e4fd")  ; Brighter cyan (from ANSI spec)
      (eld-dark-cyan     "#10A1BD")  ; Darker cyan for keywords
      (eld-blue          "#04d1f9")  ; Watery Tomb Blue (alias for cyan)
      (eld-magenta       "#f265b5")  ; Pustule Pink
      (eld-magenta2      "#bf4f8e")  ; Magenta variant (from spec)
      (eld-magenta3      "#722f55")  ; Darker magenta (from spec)
      (eld-pink          "#f265b5")  ; Pink (alias for magenta)
      (eld-purple        "#a48cf2")  ; Lovecraft Purple - Accent
      (eld-bright-purple "#9071f4")  ; Bright purple (ANSI)
      (eld-purple2       "#9D7CD8")  ; Purple variant
      (eld-comment       "#7081d0")  ; The Old One Purple - Comment
      (eld-dark3         "#6473B7")  ; Supplementary color
      (eld-dark5         "#5866A2")  ; Supplementary color
      (eld-grey          "#7081d0")  ; Grey
      (eld-visual        "#76639e")  ; Visual selection
      (eld-bright-red    "#f0313e")  ; Bright red (from spec)
      (eld-bright-yellow "#e9f941")  ; Bright yellow (ANSI)
      (eld-white         "#FFFFFF")  ; White
      ;; Derived colors
      (eld-diff-add      "#1a3a2a")  ; Diff add background
      (eld-diff-change   "#2a3a4a")  ; Diff change background
      (eld-diff-delete   "#3a1a2a")  ; Diff delete background
      (eld-git-add       "#37f499")  ; Git add
      (eld-git-change    "#04d1f9")  ; Git change
      (eld-git-delete    "#f16c75")) ; Git delete

  (custom-theme-set-faces
   'mein-eldritch

   ;; === Core Faces ===
   `(default ((,class (:background ,eld-bg :foreground ,eld-fg))))
   `(cursor  ((,class (:background ,eld-fg))))
   `(fringe  ((,class (:background ,eld-bg :foreground ,eld-fg-gutter))))
   `(region  ((,class (:background ,eld-visual))))
   `(secondary-selection ((,class (:background ,eld-bg-highlight))))
   `(highlight ((,class (:background ,eld-bg-highlight))))
   `(shadow ((,class (:foreground ,eld-comment))))
   `(success ((,class (:foreground ,eld-green :bold t))))
   `(warning ((,class (:foreground ,eld-orange :bold t))))
   `(error ((,class (:foreground ,eld-red :bold t))))
   `(link ((,class (:foreground ,eld-cyan :underline t))))
   `(link-visited ((,class (:foreground ,eld-purple :underline t))))
   `(match ((,class (:background ,eld-bg-highlight :foreground ,eld-green :bold t))))
   `(trailing-whitespace ((,class (:background ,eld-red))))

   ;; === Prompt and UI ===
   `(minibuffer-prompt ((,class (:foreground ,eld-green :bold t))))
   `(vertical-border ((,class (:foreground ,eld-purple :bold t))))
   `(window-divider ((,class (:foreground ,eld-purple))))
   `(window-divider-first-pixel ((,class (:foreground ,eld-purple))))
   `(window-divider-last-pixel ((,class (:foreground ,eld-purple))))
   `(line-number ((,class (:foreground ,eld-fg-gutter-light :background ,eld-bg))))
   `(line-number-current-line ((,class (:foreground ,eld-green :background ,eld-bg-highlight :bold t))))

   ;; === Font-lock (syntax highlighting) ===
   ;; Per official spec: functions=purple, keywords=green, variables=red, strings=yellow
   `(font-lock-builtin-face       ((,class (:foreground ,eld-cyan))))
   `(font-lock-comment-face       ((,class (:foreground ,eld-comment :slant italic))))
   `(font-lock-comment-delimiter-face ((,class (:inherit font-lock-comment-face))))
   `(font-lock-constant-face      ((,class (:foreground ,eld-bright-cyan))))
   `(font-lock-doc-face           ((,class (:foreground ,eld-yellow))))
   `(font-lock-function-name-face ((,class (:foreground ,eld-purple))))
   `(font-lock-keyword-face       ((,class (:foreground ,eld-green :bold t))))
   `(font-lock-string-face        ((,class (:foreground ,eld-yellow))))
   `(font-lock-type-face          ((,class (:foreground ,eld-bright-purple))))
   `(font-lock-variable-name-face ((,class (:foreground ,eld-red))))
   `(font-lock-warning-face       ((,class (:foreground ,eld-orange :bold t))))
   `(font-lock-preprocessor-face  ((,class (:foreground ,eld-cyan))))
   `(font-lock-negation-char-face ((,class (:foreground ,eld-purple))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,eld-cyan))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,eld-yellow))))
   `(font-lock-number-face        ((,class (:foreground ,eld-green))))

   ;; === Mode line ===
   `(mode-line ((,class (:background ,eld-bg-highlight :foreground ,eld-fg-dark :box (:line-width -1 :color ,eld-base3)))))
   `(mode-line-inactive ((,class (:background ,eld-bg :foreground ,eld-fg-gutter :box (:line-width -1 :color ,eld-base2)))))
   `(mode-line-emphasis ((,class (:foreground ,eld-cyan :bold t))))
   `(mode-line-buffer-id ((,class (:foreground ,eld-cyan :bold t))))
   `(mode-line-highlight ((,class (:foreground ,eld-green))))

   ;; === Diff ===
   `(diff-added ((,class (:background ,eld-diff-add :foreground ,eld-git-add))))
   `(diff-removed ((,class (:background ,eld-diff-delete :foreground ,eld-git-delete))))
   `(diff-changed ((,class (:background ,eld-diff-change :foreground ,eld-git-change))))
   `(diff-refine-added ((,class (:background ,eld-green :foreground ,eld-bg))))
   `(diff-refine-removed ((,class (:background ,eld-red :foreground ,eld-bg))))
   `(diff-refine-changed ((,class (:background ,eld-cyan :foreground ,eld-bg))))
   `(diff-header ((,class (:foreground ,eld-cyan :bold t))))
   `(diff-file-header ((,class (:foreground ,eld-cyan :bold t))))
   `(diff-hunk-header ((,class (:foreground ,eld-purple :bold t))))
   
   ;; === diff-hl ===
   `(diff-hl-change ((,class (:background unspecified :foreground ,eld-git-change))))
   `(diff-hl-delete ((,class (:background unspecified :foreground ,eld-git-delete))))
   `(diff-hl-insert ((,class (:background unspecified :foreground ,eld-git-add))))

   ;; === Completion (Corfu, Vertico) ===
   `(completions-first-difference ((,class (:foreground ,eld-yellow :bold t))))
   `(completions-common-part ((,class (:foreground ,eld-cyan))))

   ;; === Org mode ===
   ;; Per spec: headings should be purple and bold (like Markdown)
   `(org-level-1 ((,class (:foreground ,eld-purple :bold t :height 1.2))))
   `(org-level-2 ((,class (:foreground ,eld-purple :bold t :height 1.15))))
   `(org-level-3 ((,class (:foreground ,eld-purple :bold t :height 1.1))))
   `(org-level-4 ((,class (:foreground ,eld-purple :bold t))))
   `(org-level-5 ((,class (:foreground ,eld-purple :bold t))))
   `(org-level-6 ((,class (:foreground ,eld-purple :bold t))))
   `(org-level-7 ((,class (:foreground ,eld-purple :bold t))))
   `(org-level-8 ((,class (:foreground ,eld-purple :bold t))))

   `(org-date ((,class (:foreground ,eld-cyan :underline t))))
   `(org-todo ((,class (:foreground ,eld-orange :bold t))))
   `(org-done ((,class (:foreground ,eld-green :bold t))))
   `(org-tag ((,class (:foreground ,eld-magenta :bold t))))
   `(org-code ((,class (:foreground ,eld-green :background ,eld-base1))))
   `(org-verbatim ((,class (:foreground ,eld-yellow :background ,eld-base1))))
   `(org-block ((,class (:background ,eld-base0 :foreground ,eld-fg))))
   `(org-block-begin-line ((,class (:foreground ,eld-comment :background ,eld-base0))))
   `(org-block-end-line ((,class (:inherit org-block-begin-line))))

   ;; === Rainbow delimiters ===
   `(rainbow-delimiters-depth-1-face ((,class (:foreground ,eld-blue))))
   `(rainbow-delimiters-depth-2-face ((,class (:foreground ,eld-cyan))))
   `(rainbow-delimiters-depth-3-face ((,class (:foreground ,eld-green))))
   `(rainbow-delimiters-depth-4-face ((,class (:foreground ,eld-yellow))))
   `(rainbow-delimiters-depth-5-face ((,class (:foreground ,eld-orange))))
   `(rainbow-delimiters-depth-6-face ((,class (:foreground ,eld-magenta))))
   `(rainbow-delimiters-depth-7-face ((,class (:foreground ,eld-blue))))
   `(rainbow-delimiters-depth-8-face ((,class (:foreground ,eld-cyan))))
   `(rainbow-delimiters-depth-9-face ((,class (:foreground ,eld-green))))

   ;; === Indent guide ===
   `(indent-guide-face ((,class (:foreground ,eld-base2 :background unspecified))))

   ;; === Markdown ===
   ;; Per official spec
   `(markdown-header-face-1 ((,class (:foreground ,eld-purple :bold t))))
   `(markdown-header-face-2 ((,class (:foreground ,eld-purple :bold t))))
   `(markdown-header-face-3 ((,class (:foreground ,eld-purple :bold t))))
   `(markdown-header-face-4 ((,class (:foreground ,eld-purple :bold t))))
   `(markdown-header-face-5 ((,class (:foreground ,eld-purple :bold t))))
   `(markdown-header-face-6 ((,class (:foreground ,eld-purple :bold t))))
   `(markdown-code-face ((,class (:foreground ,eld-pink :background ,eld-base1))))
   `(markdown-inline-code-face ((,class (:foreground ,eld-pink :background ,eld-base1))))
   `(markdown-pre-face ((,class (:foreground ,eld-orange))))
   `(markdown-blockquote-face ((,class (:foreground ,eld-yellow :slant italic))))
   `(markdown-bold-face ((,class (:foreground ,eld-orange :bold t))))
   `(markdown-italic-face ((,class (:foreground ,eld-yellow :slant italic))))
   `(markdown-link-face ((,class (:foreground ,eld-orange :bold t))))
   `(markdown-url-face ((,class (:foreground ,eld-yellow :slant italic))))
   `(markdown-list-face ((,class (:foreground ,eld-cyan))))
   `(markdown-header-delimiter-face ((,class (:foreground ,eld-red))))
   `(markdown-header-rule-face ((,class (:foreground ,eld-comment))))
   `(markdown-link-title-face ((,class (:foreground ,eld-purple))))

   ;; === Search and Selection ===
   `(isearch ((,class (:background ,eld-orange :foreground ,eld-bg :bold t))))
   `(isearch-fail ((,class (:background ,eld-red :foreground ,eld-bg))))
   `(lazy-highlight ((,class (:background ,eld-bg-highlight :foreground ,eld-fg))))
   `(query-replace ((,class (:background ,eld-purple :foreground ,eld-bg))))
   
   ;; === Visual Selection ===
   `(show-paren-match ((,class (:foreground ,eld-orange :bold t :underline t))))
   `(show-paren-mismatch ((,class (:background ,eld-red :foreground ,eld-bg :bold t))))

   ;; === Dired ===
   `(dired-directory ((,class (:foreground ,eld-cyan :bold t))))
   `(dired-symlink ((,class (:foreground ,eld-cyan :italic t))))
   `(dired-perm-write ((,class (:foreground ,eld-orange))))
   `(dired-marked ((,class (:foreground ,eld-yellow :bold t))))
   `(dired-flagged ((,class (:foreground ,eld-red :bold t))))
   `(dired-header ((,class (:foreground ,eld-green :bold t))))
   `(dired-special ((,class (:foreground ,eld-purple))))

   ;; === Flymake / Flycheck / Linting ===
   `(flymake-error ((,class (:underline (:style wave :color ,eld-red) :background unspecified))))
   `(flymake-warning ((,class (:underline (:style wave :color ,eld-orange) :background unspecified))))
   `(flymake-note ((,class (:underline (:style wave :color ,eld-yellow) :background unspecified))))
   
   ;; Flycheck
   `(flycheck-error ((,class (:underline (:style wave :color ,eld-red)))))
   `(flycheck-warning ((,class (:underline (:style wave :color ,eld-orange)))))
   `(flycheck-info ((,class (:underline (:style wave :color ,eld-yellow)))))
   
   ;; LSP
   `(lsp-face-highlight-textual ((,class (:background ,eld-bg-highlight))))
   `(lsp-face-highlight-read ((,class (:background ,eld-bg-highlight))))
   `(lsp-face-highlight-write ((,class (:background ,eld-bg-highlight :bold t))))

   ;; === Vundo ===
   `(vundo-node ((,class (:foreground ,eld-fg :background unspecified))))
   `(vundo-stem ((,class (:foreground ,eld-grey :background unspecified))))
   
   ;; === Git / Magit ===
   `(magit-branch-local ((,class (:foreground ,eld-cyan :bold t))))
   `(magit-branch-remote ((,class (:foreground ,eld-green :bold t))))
   `(magit-tag ((,class (:foreground ,eld-yellow :bold t))))
   `(magit-hash ((,class (:foreground ,eld-comment))))
   `(magit-section-heading ((,class (:foreground ,eld-cyan :bold t))))
   `(magit-section-highlight ((,class (:background ,eld-bg-highlight))))
   `(magit-diff-added ((,class (:background ,eld-diff-add :foreground ,eld-git-add))))
   `(magit-diff-added-highlight ((,class (:background ,eld-diff-add :foreground ,eld-green :bold t))))
   `(magit-diff-removed ((,class (:background ,eld-diff-delete :foreground ,eld-git-delete))))
   `(magit-diff-removed-highlight ((,class (:background ,eld-diff-delete :foreground ,eld-red :bold t))))
   `(magit-diff-context-highlight ((,class (:background ,eld-bg-highlight :foreground ,eld-fg-dark))))
   `(magit-diff-hunk-heading ((,class (:background ,eld-bg-highlight :foreground ,eld-purple))))
   `(magit-diff-hunk-heading-highlight ((,class (:background ,eld-bg-highlight :foreground ,eld-purple :bold t))))
   
   ;; === Company / Completion ===
   `(company-tooltip ((,class (:background ,eld-bg-highlight :foreground ,eld-fg))))
   `(company-tooltip-selection ((,class (:background ,eld-visual :foreground ,eld-fg :bold t))))
   `(company-tooltip-common ((,class (:foreground ,eld-cyan :bold t))))
   `(company-tooltip-annotation ((,class (:foreground ,eld-comment))))
   `(company-scrollbar-bg ((,class (:background ,eld-bg-highlight))))
   `(company-scrollbar-fg ((,class (:background ,eld-fg-gutter))))
   
   ;; === Corfu ===
   `(corfu-default ((,class (:background ,eld-bg-highlight :foreground ,eld-fg))))
   `(corfu-current ((,class (:background ,eld-visual :foreground ,eld-fg :bold t))))
   `(corfu-border ((,class (:background ,eld-green))))
   `(corfu-bar ((,class (:background ,eld-fg-gutter))))
   
   ;; === Vertico ===
   `(vertico-current ((,class (:background ,eld-visual :foreground ,eld-fg :bold t))))
   
   ;; === Hl-line ===
   `(hl-line ((,class (:background ,eld-bg-highlight))))
   
   ;; === Which-key ===
   `(which-key-key-face ((,class (:foreground ,eld-cyan :bold t))))
   `(which-key-group-description-face ((,class (:foreground ,eld-purple))))
   `(which-key-command-description-face ((,class (:foreground ,eld-fg))))
   `(which-key-separator-face ((,class (:foreground ,eld-comment))))
   
   ;; === Treemacs ===
   `(treemacs-root-face ((,class (:foreground ,eld-cyan :bold t))))
   `(treemacs-directory-face ((,class (:foreground ,eld-cyan))))
   `(treemacs-file-face ((,class (:foreground ,eld-fg))))
   `(treemacs-git-modified-face ((,class (:foreground ,eld-git-change))))
   `(treemacs-git-added-face ((,class (:foreground ,eld-git-add))))
   `(treemacs-git-deleted-face ((,class (:foreground ,eld-git-delete))))
   
   ;; === Ivy ===
   `(ivy-current-match ((,class (:background ,eld-visual :foreground ,eld-fg :bold t))))
   `(ivy-minibuffer-match-face-1 ((,class (:foreground ,eld-cyan))))
   `(ivy-minibuffer-match-face-2 ((,class (:foreground ,eld-green :bold t))))
   `(ivy-minibuffer-match-face-3 ((,class (:foreground ,eld-yellow :bold t))))
   `(ivy-minibuffer-match-face-4 ((,class (:foreground ,eld-magenta :bold t))))
   
   ;; === HTML ===
   `(html-tag-face ((,class (:foreground ,eld-cyan))))
   `(html-attr-name-face ((,class (:foreground ,eld-pink))))
   `(html-attr-value-face ((,class (:foreground ,eld-yellow))))
   
   ;; === Terminal Colors ===
   `(term-color-black ((,class (:foreground ,eld-terminal-black :background ,eld-terminal-black))))
   `(term-color-red ((,class (:foreground ,eld-red :background ,eld-red))))
   `(term-color-green ((,class (:foreground ,eld-green :background ,eld-green))))
   `(term-color-yellow ((,class (:foreground ,eld-yellow :background ,eld-yellow))))
   `(term-color-blue ((,class (:foreground ,eld-purple :background ,eld-purple))))
   `(term-color-magenta ((,class (:foreground ,eld-magenta :background ,eld-magenta))))
   `(term-color-cyan ((,class (:foreground ,eld-cyan :background ,eld-cyan))))
   `(term-color-white ((,class (:foreground ,eld-fg :background ,eld-fg))))
   
   ;; === Treesitter / Tree-sitter (based on official spec) ===
   ;; Errors and punctuation
   `(tree-sitter-hl-face:error ((,class (:foreground ,eld-bright-red))))
   `(tree-sitter-hl-face:punctuation.delimiter ((,class (:foreground ,eld-fg))))
   `(tree-sitter-hl-face:punctuation.bracket ((,class (:foreground ,eld-fg))))
   `(tree-sitter-hl-face:punctuation.special ((,class (:foreground ,eld-cyan))))
   
   ;; Constants and literals
   `(tree-sitter-hl-face:constant ((,class (:foreground ,eld-bright-cyan))))
   `(tree-sitter-hl-face:constant.builtin ((,class (:foreground ,eld-bright-cyan))))
   `(tree-sitter-hl-face:constant.macro ((,class (:foreground ,eld-cyan))))
   `(tree-sitter-hl-face:number ((,class (:foreground ,eld-green))))
   `(tree-sitter-hl-face:number.float ((,class (:foreground ,eld-pink))))
   `(tree-sitter-hl-face:boolean ((,class (:foreground ,eld-green))))
   `(tree-sitter-hl-face:character ((,class (:foreground ,eld-pink))))
   
   ;; Strings
   `(tree-sitter-hl-face:string ((,class (:foreground ,eld-yellow))))
   `(tree-sitter-hl-face:string.regexp ((,class (:foreground ,eld-yellow))))
   `(tree-sitter-hl-face:string.escape ((,class (:foreground ,eld-cyan))))
   `(tree-sitter-hl-face:string.special.symbol ((,class (:foreground ,eld-green))))
   
   ;; Functions
   `(tree-sitter-hl-face:function ((,class (:foreground ,eld-purple))))
   `(tree-sitter-hl-face:function.builtin ((,class (:foreground ,eld-cyan))))
   `(tree-sitter-hl-face:function.macro ((,class (:foreground ,eld-purple))))
   `(tree-sitter-hl-face:function.method ((,class (:foreground ,eld-purple))))
   `(tree-sitter-hl-face:function.call ((,class (:foreground ,eld-purple))))
   
   ;; Variables and parameters
   `(tree-sitter-hl-face:variable ((,class (:foreground ,eld-red))))
   `(tree-sitter-hl-face:variable.builtin ((,class (:foreground ,eld-green))))
   `(tree-sitter-hl-face:variable.parameter ((,class (:foreground ,eld-orange))))
   `(tree-sitter-hl-face:variable.member ((,class (:foreground ,eld-orange))))
   `(tree-sitter-hl-face:property ((,class (:foreground ,eld-bright-green))))
   
   ;; Keywords
   `(tree-sitter-hl-face:keyword ((,class (:foreground ,eld-green))))
   `(tree-sitter-hl-face:keyword.function ((,class (:foreground ,eld-cyan))))
   `(tree-sitter-hl-face:keyword.operator ((,class (:foreground ,eld-purple))))
   `(tree-sitter-hl-face:keyword.conditional ((,class (:foreground ,eld-purple))))
   `(tree-sitter-hl-face:keyword.repeat ((,class (:foreground ,eld-purple))))
   `(tree-sitter-hl-face:keyword.exception ((,class (:foreground ,eld-green))))
   `(tree-sitter-hl-face:keyword.include ((,class (:foreground ,eld-purple))))
   
   ;; Operators
   `(tree-sitter-hl-face:operator ((,class (:foreground ,eld-purple))))
   
   ;; Types
   `(tree-sitter-hl-face:type ((,class (:foreground ,eld-bright-purple))))
   `(tree-sitter-hl-face:type.builtin ((,class (:foreground ,eld-cyan :slant italic))))
   `(tree-sitter-hl-face:type.qualifier ((,class (:foreground ,eld-purple))))
   `(tree-sitter-hl-face:type.definition ((,class (:foreground ,eld-yellow))))
   
   ;; Constructors and modules
   `(tree-sitter-hl-face:constructor ((,class (:foreground ,eld-cyan))))
   `(tree-sitter-hl-face:module ((,class (:foreground ,eld-orange))))
   
   ;; Annotations and attributes
   `(tree-sitter-hl-face:annotation ((,class (:foreground ,eld-yellow))))
   `(tree-sitter-hl-face:attribute ((,class (:foreground ,eld-cyan))))
   
   ;; Labels
   `(tree-sitter-hl-face:label ((,class (:foreground ,eld-cyan))))
   
   ;; Tags (HTML/XML)
   `(tree-sitter-hl-face:tag ((,class (:foreground ,eld-cyan))))
   `(tree-sitter-hl-face:tag.attribute ((,class (:foreground ,eld-pink))))
   `(tree-sitter-hl-face:tag.delimiter ((,class (:foreground ,eld-cyan))))
   
   ;; Markup (Markdown, etc.)
   `(tree-sitter-hl-face:markup ((,class (:foreground ,eld-orange))))
   `(tree-sitter-hl-face:markup.strong ((,class (:foreground ,eld-orange :bold t))))
   `(tree-sitter-hl-face:markup.emphasis ((,class (:foreground ,eld-yellow :slant italic))))
   `(tree-sitter-hl-face:markup.underline ((,class (:foreground ,eld-orange :underline t))))
   `(tree-sitter-hl-face:markup.heading ((,class (:foreground ,eld-purple :bold t))))
   `(tree-sitter-hl-face:markup.raw ((,class (:foreground ,eld-yellow))))
   `(tree-sitter-hl-face:markup.link ((,class (:foreground ,eld-orange :bold t))))
   `(tree-sitter-hl-face:markup.link.url ((,class (:foreground ,eld-yellow :slant italic))))
   `(tree-sitter-hl-face:markup.list ((,class (:foreground ,eld-cyan))))

   ))

(provide-theme 'mein-eldritch)
;;; mein-eldritch-theme.el ends here
