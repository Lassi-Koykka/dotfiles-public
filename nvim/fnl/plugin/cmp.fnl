(local cmp (require :cmp))
(local lspkind (require :lspkind))
(local luasnip (require :luasnip))

; --- Sources ---
(local sources (let [disabled-sources (or vim.g.disabled_cmp_sources [])
                     enabled-sources {}]
                 (each [_ source (ipairs [{:name :nvim_lsp}
                                          {:name :conjure}
                                          {:name :luasnip}
                                          {:name :path}
                                          {:name :buffer}
                                          {:name :calc}
                                          {:name :emoji}
                                          {}
                                          ])]
                   (var disabled? false)
                   (each [_ disabled (ipairs disabled-sources)]
                     (if (= source.name disabled)
                         (set disabled? true)))
                   (if (not disabled?)
                       (table.insert enabled-sources source)))
                 enabled-sources))

; --- Mappings ---
(local mappings {:<C-b> (cmp.mapping.scroll_docs -4)
                 :<C-f> (cmp.mapping.scroll_docs 4)
                 :<C-space> (cmp.mapping.complete)
                 :<C-y> cmp.config.disable
                 :<C-e> (cmp.mapping {:i (cmp.mapping.abort)
                                      :c (cmp.mapping.close)})
                 :<S-Tab> (fn [fallback]
                            (if (cmp.visible)
                                (cmp.select_prev_item {:behavior cmp.SelectBehavior.Insert})
                                (fallback)))
                 :<Tab> (fn [fallback]
                          (if (cmp.visible)
                              (cmp.select_next_item {:behavior cmp.SelectBehavior.Insert})
                              (fallback)))
                 :<Up> (fn [fallback]
                         (if (cmp.visible)
                             (cmp.select_prev_item {:behavior cmp.SelectBehavior.Insert})
                             (fallback)))
                 :<Down> (fn [fallback]
                           (if (cmp.visible)
                               (cmp.select_next_item {:behavior cmp.SelectBehavior.Insert})
                               (fallback)))
                 :<CR> (cmp.mapping.confirm {:select true})})

(local format (lspkind.cmp_format 
                  {:mode :symbol_text 
                   :maxwidth 50
                   :before (fn [entry vim_item]
                               (set vim_item.kind
                                    (.. (. lspkind.presets.default
                                           vim_item.kind)
                                        " "
                                        vim_item.kind))
                               (set vim_item.menu
                                    (. {:path "[Path]"
                                        :buffer "[Buffer]"
                                        :calc "[Calc]"
                                        :nvim_lsp "[LSP]"
                                        :cmp_tabnine "[TabNine]"
                                        :luasnip "[LuaSnip]"
                                        :emoji "[Emoji]"}
                                       entry.source.name))
                               vim_item)})
    )

; --- Setup ---
(cmp.setup {:snippet {:expand (fn [args]
                                (luasnip.lsp_expand args.body))}
            :mapping mappings
            :window {:completion (cmp.config.window.bordered)
                     :documentation (cmp.config.window.bordered)}
            :formatting {:format format}
            : sources})

;; Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
(cmp.setup.cmdline "/" {:mapping (cmp.mapping.preset.cmdline) 
                        :sources [{:name :buffer}]})

;; Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
(cmp.setup.cmdline ":" {:mapping (cmp.mapping.preset.cmdline)
                        :sources (cmp.config.sources [{:name :path}] 
                                                     [{:name :cmdline 
                                                       :option {:ignore_cmds ["Man" "!" "Shell"]}}])})
