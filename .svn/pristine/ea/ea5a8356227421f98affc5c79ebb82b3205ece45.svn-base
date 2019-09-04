! function(e) {
    if ("object" == typeof exports && "undefined" != typeof module) module.exports = e();
    else if ("function" == typeof define && define.amd) define([], e);
    else {
        ("undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof self ? self : this).jsBeautify = e()
    }
}(function() {
    return function() {
        return function e(t, n, i) {
            function r(a, _) {
                if (!n[a]) {
                    if (!t[a]) {
                        var o = "function" == typeof require && require;
                        if (!_ && o) return o(a, !0);
                        if (s) return s(a, !0);
                        var l = new Error("Cannot find module '" + a + "'");
                        throw l.code = "MODULE_NOT_FOUND", l
                    }
                    var u = n[a] = {
                        exports: {}
                    };
                    t[a][0].call(u.exports, function(e) {
                        var n = t[a][1][e];
                        return r(n || e)
                    }, u, u.exports, e, t, n, i)
                }
                return n[a].exports
            }
            for (var s = "function" == typeof require && require, a = 0; a < i.length; a++) r(i[a]);
            return r
        }
    }()({
        1: [function(e, t, n) {
            function i(e, t, n) {
                var i = function(t, n) {
                    return e.js_beautify(t, n)
                };
                return i.js = e.js_beautify, i.css = t.css_beautify, i.html = n.html_beautify, i.js_beautify = e.js_beautify, i.css_beautify = t.css_beautify, i.html_beautify = n.html_beautify, i
            }
            var r, s, a, _;
            r = t, s = e("./lib/beautify"), a = e("./lib/beautify-css"), _ = e("./lib/beautify-html"), r.exports = i(s, a, _)
        }, {
            "./lib/beautify": 4,
            "./lib/beautify-css": 2,
            "./lib/beautify-html": 3
        }],
        2: [function(e, t, n) {
            (function(e) {
                var t;
                t = function(e) {
                    var t = {};

                    function n(i) {
                        if (t[i]) return t[i].exports;
                        var r = t[i] = {
                            i: i,
                            l: !1,
                            exports: {}
                        };
                        return e[i].call(r.exports, r, r.exports, n), r.l = !0, r.exports
                    }
                    return n.m = e, n.c = t, n.i = function(e) {
                        return e
                    }, n.d = function(e, t, i) {
                        n.o(e, t) || Object.defineProperty(e, t, {
                            configurable: !1,
                            enumerable: !0,
                            get: i
                        })
                    }, n.n = function(e) {
                        var t = e && e.__esModule ? function() {
                            return e.default
                        } : function() {
                            return e
                        };
                        return n.d(t, "a", t), t
                    }, n.o = function(e, t) {
                        return Object.prototype.hasOwnProperty.call(e, t)
                    }, n.p = "", n(n.s = 4)
                }([function(e, t, n) {
                    var i = n(2).mergeOpts,
                        r = n(1),
                        s = n(3).Output,
                        a = r.lineBreak,
                        _ = r.allLineBreaks;
                    e.exports.Beautifier = function(e, t) {
                        t = i(t = t || {}, "css"), e = e || "";
                        var n = 0,
                            r = t.indent_size ? parseInt(t.indent_size, 10) : 4,
                            o = t.indent_char || " ",
                            l = void 0 !== t.preserve_newlines && t.preserve_newlines,
                            u = void 0 === t.selector_separator_newline || t.selector_separator_newline,
                            c = void 0 !== t.end_with_newline && t.end_with_newline,
                            h = void 0 === t.newline_between_rules || t.newline_between_rules,
                            p = void 0 !== t.space_around_combinator && t.space_around_combinator;
                        p = p || void 0 !== t.space_around_selector_separator && t.space_around_selector_separator;
                        var f = t.eol ? t.eol : "auto";
                        t.indent_with_tabs && (o = "\t", r = 1), "auto" === f && (f = "\n", e && a.test(e || "") && (f = e.match(a)[0])), f = f.replace(/\\r/, "\r").replace(/\\n/, "\n"), e = e.replace(_, "\n");
                        var d, T = /^\s+$/,
                            g = -1,
                            m = 0;

                        function x() {
                            return (d = e.charAt(++g)) || ""
                        }

                        function E(t) {
                            var n, i = g;
                            return t && w(), n = e.charAt(g + 1) || "", g = i - 1, x(), n
                        }

                        function b(t) {
                            for (var n = g; x();)
                                if ("\\" === d) x();
                                else {
                                    if (-1 !== t.indexOf(d)) break;
                                    if ("\n" === d) break
                                }
                            return e.substring(n, g + 1)
                        }

                        function w(e) {
                            for (var t = 0; T.test(E());) x(), "\n" === d && e && l && (C.add_new_line(!0), t++);
                            return n = t, t
                        }

                        function v() {
                            var e = "";
                            for (d && T.test(d) && (e = d); T.test(x());) e += d;
                            return e
                        }

                        function k() {
                            var t = g,
                                n = "/" === E();
                            for (x(); x();) {
                                if (!n && "*" === d && "/" === E()) {
                                    x();
                                    break
                                }
                                if (n && "\n" === d) return e.substring(t, g)
                            }
                            return e.substring(t, g) + d
                        }

                        function y(t) {
                            return e.substring(g - t.length, g).toLowerCase() === t
                        }

                        function R() {
                            for (var t = 0, n = g + 1; n < e.length; n++) {
                                var i = e.charAt(n);
                                if ("{" === i) return !0;
                                if ("(" === i) t += 1;
                                else if (")" === i) {
                                    if (0 === t) return !1;
                                    t -= 1
                                } else if (";" === i || "}" === i) return !1
                            }
                            return !1
                        }
                        var K = "",
                            O = 0;
                        if (e && e.length) {
                            for (;
                                " " === e.charAt(O) || "\t" === e.charAt(O);) O += 1;
                            K = e.substring(0, O), e = e.substring(O)
                        }
                        var S, A, C, N = new Array(r + 1).join(o);

                        function D(e) {
                            C.just_added_newline() && C.set_indent(S), C.add_token(e)
                        }

                        function L(e) {
                            e && (C.space_before_token = !0)
                        }
                        this.beautify = function() {
                            C = new s(N, K), S = 0, A = 0, g = -1, d = null, m = 0;
                            for (var e, t, i = !1, r = !1, a = !1, _ = "", o = "";;) {
                                var l = v(),
                                    O = "" !== l,
                                    j = -1 !== l.indexOf("\n");
                                if (o = _, _ = d, !d) break;
                                if ("/" === d && "*" === E()) {
                                    var I = 0 === S;
                                    (j || I) && C.add_new_line(), D(k()), C.add_new_line(), I && C.add_new_line(!0)
                                } else if ("/" === d && "/" === E()) j || "{" === o || C.trim(!0), C.space_before_token = !0, D(k()), C.add_new_line();
                                else if ("@" === d)
                                    if (L(O), "{" === E()) D(b("}"));
                                    else {
                                        D(d);
                                        var B = (e = g, t = b(": ,;{}()[]/='\""), g = e - 1, x(), t);
                                        B.match(/[ :]$/) && (x(), D(B = b(": ").replace(/\s$/, "")), C.space_before_token = !0), (B = B.replace(/\s$/, "")) in this.NESTED_AT_RULE && (A += 1, B in this.CONDITIONAL_GROUP_RULE && (a = !0))
                                    }
                                else "#" === d && "{" === E() ? (L(O), D(b("}"))) : "{" === d ? "}" === E(!0) ? (w(), x(), C.space_before_token = !0, D("{}"), w(!0) || C.add_new_line(), n < 2 && h && 0 === S && C.add_new_line(!0)) : (S++, C.space_before_token = !0, D(d), w(!0) || C.add_new_line(), a ? (a = !1, i = S > A) : i = S >= A) : "}" === d ? (S > 0 && S--, C.add_new_line(), D(d), i = !1, r = !1, A && A--, w(!0) || C.add_new_line(), n < 2 && h && 0 === S && C.add_new_line(!0)) : ":" === d ? (w(), !i && !a || y("&") || R() || y("(") ? (y(" ") && (C.space_before_token = !0), ":" === E() ? (x(), D("::")) : D(":")) : (D(":"), r || (r = !0, C.space_before_token = !0))) : '"' === d || "'" === d ? (L(O), D(b(d))) : ";" === d ? (r = !1, D(d), w(!0) || C.add_new_line()) : "(" === d ? y("url") ? (D(d), w(), x() && (")" !== d && '"' !== d && "'" !== d ? D(b(")")) : g--)) : (m++, L(O), D(d), w()) : ")" === d ? (D(d), m--) : "," === d ? (D(d), !w(!0) && u && !r && m < 1 ? C.add_new_line() : C.space_before_token = !0) : (">" === d || "+" === d || "~" === d) && !r && m < 1 ? p ? (C.space_before_token = !0, D(d), C.space_before_token = !0) : (D(d), w(), d && T.test(d) && (d = "")) : "]" === d ? D(d) : "[" === d ? (L(O), D(d)) : "=" === d ? (w(), D("="), T.test(d) && (d = "")) : "!" === d ? (D(" "), D(d)) : (L(O), D(d))
                            }
                            return C.get_code(c, f)
                        }, this.NESTED_AT_RULE = {
                            "@page": !0,
                            "@font-face": !0,
                            "@keyframes": !0,
                            "@media": !0,
                            "@supports": !0,
                            "@document": !0
                        }, this.CONDITIONAL_GROUP_RULE = {
                            "@media": !0,
                            "@supports": !0,
                            "@document": !0
                        }
                    }
                }, function(e, t) {
                    var n = "ªµºÀ-ÖØ-öø-ˁˆ-ˑˠ-ˤˬˮͰ-ʹͶͷͺ-ͽΆΈ-ΊΌΎ-ΡΣ-ϵϷ-ҁҊ-ԧԱ-Ֆՙա-ևא-תװ-ײؠ-يٮٯٱ-ۓەۥۦۮۯۺ-ۼۿܐܒ-ܯݍ-ޥޱߊ-ߪߴߵߺࠀ-ࠕࠚࠤࠨࡀ-ࡘࢠࢢ-ࢬऄ-हऽॐक़-ॡॱ-ॷॹ-ॿঅ-ঌএঐও-নপ-রলশ-হঽৎড়ঢ়য়-ৡৰৱਅ-ਊਏਐਓ-ਨਪ-ਰਲਲ਼ਵਸ਼ਸਹਖ਼-ੜਫ਼ੲ-ੴઅ-ઍએ-ઑઓ-નપ-રલળવ-હઽૐૠૡଅ-ଌଏଐଓ-ନପ-ରଲଳଵ-ହଽଡ଼ଢ଼ୟ-ୡୱஃஅ-ஊஎ-ஐஒ-கஙசஜஞடணதந-பம-ஹௐఅ-ఌఎ-ఐఒ-నప-ళవ-హఽౘౙౠౡಅ-ಌಎ-ಐಒ-ನಪ-ಳವ-ಹಽೞೠೡೱೲഅ-ഌഎ-ഐഒ-ഺഽൎൠൡൺ-ൿඅ-ඖක-නඳ-රලව-ෆก-ะาำเ-ๆກຂຄງຈຊຍດ-ທນ-ຟມ-ຣລວສຫອ-ະາຳຽເ-ໄໆໜ-ໟༀཀ-ཇཉ-ཬྈ-ྌက-ဪဿၐ-ၕၚ-ၝၡၥၦၮ-ၰၵ-ႁႎႠ-ჅჇჍა-ჺჼ-ቈቊ-ቍቐ-ቖቘቚ-ቝበ-ኈኊ-ኍነ-ኰኲ-ኵኸ-ኾዀዂ-ዅወ-ዖዘ-ጐጒ-ጕጘ-ፚᎀ-ᎏᎠ-Ᏼᐁ-ᙬᙯ-ᙿᚁ-ᚚᚠ-ᛪᛮ-ᛰᜀ-ᜌᜎ-ᜑᜠ-ᜱᝀ-ᝑᝠ-ᝬᝮ-ᝰក-ឳៗៜᠠ-ᡷᢀ-ᢨᢪᢰ-ᣵᤀ-ᤜᥐ-ᥭᥰ-ᥴᦀ-ᦫᧁ-ᧇᨀ-ᨖᨠ-ᩔᪧᬅ-ᬳᭅ-ᭋᮃ-ᮠᮮᮯᮺ-ᯥᰀ-ᰣᱍ-ᱏᱚ-ᱽᳩ-ᳬᳮ-ᳱᳵᳶᴀ-ᶿḀ-ἕἘ-Ἕἠ-ὅὈ-Ὅὐ-ὗὙὛὝὟ-ώᾀ-ᾴᾶ-ᾼιῂ-ῄῆ-ῌῐ-ΐῖ-Ίῠ-Ῥῲ-ῴῶ-ῼⁱⁿₐ-ₜℂℇℊ-ℓℕℙ-ℝℤΩℨK-ℭℯ-ℹℼ-ℿⅅ-ⅉⅎⅠ-ↈⰀ-Ⱞⰰ-ⱞⱠ-ⳤⳫ-ⳮⳲⳳⴀ-ⴥⴧⴭⴰ-ⵧⵯⶀ-ⶖⶠ-ⶦⶨ-ⶮⶰ-ⶶⶸ-ⶾⷀ-ⷆⷈ-ⷎⷐ-ⷖⷘ-ⷞⸯ々-〇〡-〩〱-〵〸-〼ぁ-ゖゝ-ゟァ-ヺー-ヿㄅ-ㄭㄱ-ㆎㆠ-ㆺㇰ-ㇿ㐀-䶵一-鿌ꀀ-ꒌꓐ-ꓽꔀ-ꘌꘐ-ꘟꘪꘫꙀ-ꙮꙿ-ꚗꚠ-ꛯꜗ-ꜟꜢ-ꞈꞋ-ꞎꞐ-ꞓꞠ-Ɦꟸ-ꠁꠃ-ꠅꠇ-ꠊꠌ-ꠢꡀ-ꡳꢂ-ꢳꣲ-ꣷꣻꤊ-ꤥꤰ-ꥆꥠ-ꥼꦄ-ꦲꧏꨀ-ꨨꩀ-ꩂꩄ-ꩋꩠ-ꩶꩺꪀ-ꪯꪱꪵꪶꪹ-ꪽꫀꫂꫛ-ꫝꫠ-ꫪꫲ-ꫴꬁ-ꬆꬉ-ꬎꬑ-ꬖꬠ-ꬦꬨ-ꬮꯀ-ꯢ가-힣ힰ-ퟆퟋ-ퟻ豈-舘並-龎ﬀ-ﬆﬓ-ﬗיִײַ-ﬨשׁ-זּטּ-לּמּנּסּףּפּצּ-ﮱﯓ-ﴽﵐ-ﶏﶒ-ﷇﷰ-ﷻﹰ-ﹴﹶ-ﻼＡ-Ｚａ-ｚｦ-ﾾￂ-ￇￊ-ￏￒ-ￗￚ-ￜ",
                        i = new RegExp("[" + n + "]"),
                        r = new RegExp("[" + n + "̀-ͯ҃-֑҇-ׇֽֿׁׂׅׄؐ-ؚؠ-ىٲ-ۓۧ-ۨۻ-ۼܰ-݊ࠀ-ࠔࠛ-ࠣࠥ-ࠧࠩ-࠭ࡀ-ࡗࣤ-ࣾऀ-ःऺ-़ा-ॏ॑-ॗॢ-ॣ०-९ঁ-ঃ়া-ৄেৈৗয়-ৠਁ-ਃ਼ਾ-ੂੇੈੋ-੍ੑ੦-ੱੵઁ-ઃ઼ા-ૅે-ૉો-્ૢ-ૣ૦-૯ଁ-ଃ଼ା-ୄେୈୋ-୍ୖୗୟ-ୠ୦-୯ஂா-ூெ-ைொ-்ௗ௦-௯ఁ-ఃె-ైొ-్ౕౖౢ-ౣ౦-౯ಂಃ಼ಾ-ೄೆ-ೈೊ-್ೕೖೢ-ೣ೦-೯ംഃെ-ൈൗൢ-ൣ൦-൯ංඃ්ා-ුූෘ-ෟෲෳิ-ฺเ-ๅ๐-๙ິ-ູ່-ໍ໐-໙༘༙༠-༩༹༵༷ཁ-ཇཱ-྄྆-྇ྍ-ྗྙ-ྼ࿆က-ဩ၀-၉ၧ-ၭၱ-ၴႂ-ႍႏ-ႝ፝-፟ᜎ-ᜐᜠ-ᜰᝀ-ᝐᝲᝳក-ឲ៝០-៩᠋-᠍᠐-᠙ᤠ-ᤫᤰ-᤻ᥑ-ᥭᦰ-ᧀᧈ-ᧉ᧐-᧙ᨀ-ᨕᨠ-ᩓ᩠-᩿᩼-᪉᪐-᪙ᭆ-ᭋ᭐-᭙᭫-᭳᮰-᮹᯦-᯳ᰀ-ᰢ᱀-᱉ᱛ-ᱽ᳐-᳒ᴀ-ᶾḁ-ἕ‌‍‿⁀⁔⃐-⃥⃜⃡-⃰ⶁ-ⶖⷠ-ⷿ〡-〨゙゚Ꙁ-ꙭꙴ-꙽ꚟ꛰-꛱ꟸ-ꠀ꠆ꠋꠣ-ꠧꢀ-ꢁꢴ-꣄꣐-꣙ꣳ-ꣷ꤀-꤉ꤦ-꤭ꤰ-ꥅꦀ-ꦃ꦳-꧀ꨀ-ꨧꩀ-ꩁꩌ-ꩍ꩐-꩙ꩻꫠ-ꫩꫲ-ꫳꯀ-ꯡ꯬꯭꯰-꯹ﬠ-ﬨ︀-️︠-︦︳︴﹍-﹏０-９＿]");
                    t.newline = /[\n\r\u2028\u2029]/, t.lineBreak = new RegExp("\r\n|" + t.newline.source), t.allLineBreaks = new RegExp(t.lineBreak.source, "g"), t.isIdentifierStart = function(e) {
                        return e < 65 ? 36 === e || 64 === e : e < 91 || (e < 97 ? 95 === e : e < 123 || e >= 170 && i.test(String.fromCharCode(e)))
                    }, t.isIdentifierChar = function(e) {
                        return e < 48 ? 36 === e : e < 58 || !(e < 65) && (e < 91 || (e < 97 ? 95 === e : e < 123 || e >= 170 && r.test(String.fromCharCode(e))))
                    }
                }, function(e, t) {
                    e.exports.mergeOpts = function(e, t) {
                        var n, i = {};
                        for (n in e) n !== t && (i[n] = e[n]);
                        if (t in e)
                            for (n in e[t]) i[n] = e[t][n];
                        return i
                    }
                }, function(e, t) {
                    e.exports.Output = function(e, t) {
                        t = t || "", this.indent_cache = [t], this.baseIndentLength = t.length, this.indent_length = e.length, this.raw = !1;
                        var n = [];
                        this.baseIndentString = t, this.indent_string = e, this.previous_line = null, this.current_line = null, this.space_before_token = !1, this.add_outputline = function() {
                            this.previous_line = this.current_line, this.current_line = new function(e) {
                                var t = 0,
                                    n = -1,
                                    i = [],
                                    r = !0;
                                this.set_indent = function(i) {
                                    t = e.baseIndentLength + i * e.indent_length, n = i
                                }, this.get_character_count = function() {
                                    return t
                                }, this.is_empty = function() {
                                    return r
                                }, this.last = function() {
                                    return this._empty ? null : i[i.length - 1]
                                }, this.push = function(e) {
                                    i.push(e), t += e.length, r = !1
                                }, this.pop = function() {
                                    var e = null;
                                    return r || (e = i.pop(), t -= e.length, r = 0 === i.length), e
                                }, this.remove_indent = function() {
                                    n > 0 && (n -= 1, t -= e.indent_length)
                                }, this.trim = function() {
                                    for (;
                                        " " === this.last();) i.pop(), t -= 1;
                                    r = 0 === i.length
                                }, this.toString = function() {
                                    var t = "";
                                    return this._empty || (n >= 0 && (t = e.indent_cache[n]), t += i.join("")), t
                                }
                            }(this), n.push(this.current_line)
                        }, this.add_outputline(), this.get_line_number = function() {
                            return n.length
                        }, this.add_new_line = function(e) {
                            return !(1 === this.get_line_number() && this.just_added_newline() || !e && this.just_added_newline() || (this.raw || this.add_outputline(), 0))
                        }, this.get_code = function(e, t) {
                            var i = n.join("\n").replace(/[\r\n\t ]+$/, "");
                            return e && (i += "\n"), "\n" !== t && (i = i.replace(/[\n]/g, t)), i
                        }, this.set_indent = function(e) {
                            if (n.length > 1) {
                                for (; e >= this.indent_cache.length;) this.indent_cache.push(this.indent_cache[this.indent_cache.length - 1] + this.indent_string);
                                return this.current_line.set_indent(e), !0
                            }
                            return this.current_line.set_indent(0), !1
                        }, this.add_raw_token = function(e) {
                            for (var t = 0; t < e.newlines; t++) this.add_outputline();
                            this.current_line.push(e.whitespace_before), this.current_line.push(e.text), this.space_before_token = !1
                        }, this.add_token = function(e) {
                            this.add_space_before_token(), this.current_line.push(e)
                        }, this.add_space_before_token = function() {
                            this.space_before_token && !this.just_added_newline() && this.current_line.push(" "), this.space_before_token = !1
                        }, this.remove_indent = function(e) {
                            for (var t = n.length; e < t;) n[e].remove_indent(), e++
                        }, this.trim = function(i) {
                            for (i = void 0 !== i && i, this.current_line.trim(e, t); i && n.length > 1 && this.current_line.is_empty();) n.pop(), this.current_line = n[n.length - 1], this.current_line.trim();
                            this.previous_line = n.length > 1 ? n[n.length - 2] : null
                        }, this.just_added_newline = function() {
                            return this.current_line.is_empty()
                        }, this.just_added_blankline = function() {
                            return !!this.just_added_newline() && (1 === n.length || n[n.length - 2].is_empty())
                        }
                    }
                }, function(e, t, n) {
                    var i = n(0).Beautifier;
                    e.exports = function(e, t) {
                        return new i(e, t).beautify()
                    }
                }]), void 0 !== n ? n.css_beautify = t : "undefined" != typeof window ? window.css_beautify = t : void 0 !== e && (e.css_beautify = t)
            }).call(this, "undefined" != typeof global ? global : "undefined" != typeof self ? self : "undefined" != typeof window ? window : {})
        }, {}],
        3: [function(e, t, n) {
            (function(t) {
                ! function() {
                    var i = function(e) {
                        var t = {};

                        function n(i) {
                            if (t[i]) return t[i].exports;
                            var r = t[i] = {
                                i: i,
                                l: !1,
                                exports: {}
                            };
                            return e[i].call(r.exports, r, r.exports, n), r.l = !0, r.exports
                        }
                        return n.m = e, n.c = t, n.i = function(e) {
                            return e
                        }, n.d = function(e, t, i) {
                            n.o(e, t) || Object.defineProperty(e, t, {
                                configurable: !1,
                                enumerable: !0,
                                get: i
                            })
                        }, n.n = function(e) {
                            var t = e && e.__esModule ? function() {
                                return e.default
                            } : function() {
                                return e
                            };
                            return n.d(t, "a", t), t
                        }, n.o = function(e, t) {
                            return Object.prototype.hasOwnProperty.call(e, t)
                        }, n.p = "", n(n.s = 3)
                    }([function(e, t, n) {
                        var i = n(2).mergeOpts,
                            r = n(1),
                            s = r.lineBreak,
                            a = r.allLineBreaks;

                        function _(e) {
                            return e.replace(/\s+$/g, "")
                        }
                        e.exports.Beautifier = function(e, t, n, r) {
                            var o, l, u, c, h, p, f, d, T, g, m, x, E, b, w, v, k, y, R, K, O;
                            e = e || "", void 0 !== (t = i(t = t || {}, "html")).wrap_line_length && 0 !== parseInt(t.wrap_line_length, 10) || void 0 === t.max_char || 0 === parseInt(t.max_char, 10) || (t.wrap_line_length = t.max_char), l = void 0 !== t.indent_inner_html && t.indent_inner_html, u = void 0 === t.indent_body_inner_html || t.indent_body_inner_html, c = void 0 === t.indent_head_inner_html || t.indent_head_inner_html, h = void 0 === t.indent_size ? 4 : parseInt(t.indent_size, 10), p = void 0 === t.indent_char ? " " : t.indent_char, d = void 0 === t.brace_style ? "collapse" : t.brace_style, f = 0 === parseInt(t.wrap_line_length, 10) ? 32786 : parseInt(t.wrap_line_length || 250, 10), T = t.unformatted || ["a", "abbr", "area", "audio", "b", "bdi", "bdo", "br", "button", "canvas", "cite", "code", "data", "datalist", "del", "dfn", "em", "embed", "i", "iframe", "img", "input", "ins", "kbd", "keygen", "label", "map", "mark", "math", "meter", "noscript", "object", "output", "progress", "q", "ruby", "s", "samp", "select", "small", "span", "strong", "sub", "sup", "svg", "template", "textarea", "time", "u", "var", "video", "wbr", "text", "acronym", "address", "big", "dt", "ins", "strike", "tt"], g = t.content_unformatted || ["pre"], m = void 0 === t.preserve_newlines || t.preserve_newlines, x = m ? isNaN(parseInt(t.max_preserve_newlines, 10)) ? 32786 : parseInt(t.max_preserve_newlines, 10) : 0, E = void 0 !== t.indent_handlebars && t.indent_handlebars, b = void 0 === t.wrap_attributes ? "auto" : t.wrap_attributes, w = isNaN(parseInt(t.wrap_attributes_indent_size, 10)) ? h : parseInt(t.wrap_attributes_indent_size, 10), v = "force" === b.substr(0, "force".length), k = "force-expand-multiline" === b, y = "force-aligned" === b, R = void 0 !== t.end_with_newline && t.end_with_newline, K = "object" == typeof t.extra_liners && t.extra_liners ? t.extra_liners.concat() : "string" == typeof t.extra_liners ? t.extra_liners.split(",") : "head,body,/html".split(","), O = t.eol ? t.eol : "auto", t.indent_with_tabs && (p = "\t", h = 1), "auto" === O && (O = "\n", e && s.test(e || "") && (O = e.match(s)[0])), O = O.replace(/\\r/, "\r").replace(/\\n/, "\n"), e = e.replace(a, "\n"), this.beautify = function() {
                                for ((o = new function() {
                                        return this.pos = 0, this.token = "", this.current_mode = "CONTENT", this.tags = {
                                            parent: "parent1",
                                            parentcount: 1,
                                            parent1: ""
                                        }, this.tag_type = "", this.token_text = this.last_token = this.last_text = this.token_type = "", this.newlines = 0, this.indent_content = l, this.indent_body_inner_html = u, this.indent_head_inner_html = c, this.Utils = {
                                            whitespace: "\n\r\t ".split(""),
                                            single_token: t.void_elements || ["area", "base", "br", "col", "embed", "hr", "img", "input", "keygen", "link", "menuitem", "meta", "param", "source", "track", "wbr", "!doctype", "?xml", "?php", "basefont", "isindex"],
                                            extra_liners: K,
                                            in_array: function(e, t) {
                                                for (var n = 0; n < t.length; n++)
                                                    if (e === t[n]) return !0;
                                                return !1
                                            }
                                        }, this.is_whitespace = function(e) {
                                            for (var t = 0; t < e.length; t++)
                                                if (!this.Utils.in_array(e.charAt(t), this.Utils.whitespace)) return !1;
                                            return !0
                                        }, this.traverse_whitespace = function() {
                                            var e = "";
                                            if (e = this.input.charAt(this.pos), this.Utils.in_array(e, this.Utils.whitespace)) {
                                                for (this.newlines = 0; this.Utils.in_array(e, this.Utils.whitespace);) m && "\n" === e && this.newlines <= x && (this.newlines += 1), this.pos++, e = this.input.charAt(this.pos);
                                                return !0
                                            }
                                            return !1
                                        }, this.space_or_wrap = function(e) {
                                            return this.line_char_count >= this.wrap_line_length ? (this.print_newline(!1, e), this.print_indentation(e), !0) : (this.line_char_count++, e.push(" "), !1)
                                        }, this.get_content = function() {
                                            for (var e = "", t = [], n = 0;
                                                "<" !== this.input.charAt(this.pos) || 2 === n;) {
                                                if (this.pos >= this.input.length) return t.length ? t.join("") : ["", "TK_EOF"];
                                                if (n < 2 && this.traverse_whitespace()) this.space_or_wrap(t);
                                                else {
                                                    if (e = this.input.charAt(this.pos), E) {
                                                        if ("{" === e ? n += 1 : n < 2 && (n = 0), "}" === e && n > 0 && 0 == n--) break;
                                                        var i = this.input.substr(this.pos, 3);
                                                        if ("{{#" === i || "{{/" === i) break;
                                                        if ("{{!" === i) return [this.get_tag(), "TK_TAG_HANDLEBARS_COMMENT"];
                                                        if ("{{" === this.input.substr(this.pos, 2) && "{{else}}" === this.get_tag(!0)) break
                                                    }
                                                    this.pos++, this.line_char_count++, t.push(e)
                                                }
                                            }
                                            return t.length ? t.join("") : ""
                                        }, this.get_contents_to = function(e) {
                                            if (this.pos === this.input.length) return ["", "TK_EOF"];
                                            var t = "",
                                                n = new RegExp("</" + e + "\\s*>", "igm");
                                            n.lastIndex = this.pos;
                                            var i = n.exec(this.input),
                                                r = i ? i.index : this.input.length;
                                            return this.pos < r && (t = this.input.substring(this.pos, r), this.pos = r), t
                                        }, this.record_tag = function(e) {
                                            this.tags[e + "count"] ? (this.tags[e + "count"]++, this.tags[e + this.tags[e + "count"]] = this.indent_level) : (this.tags[e + "count"] = 1, this.tags[e + this.tags[e + "count"]] = this.indent_level), this.tags[e + this.tags[e + "count"] + "parent"] = this.tags.parent, this.tags.parent = e + this.tags[e + "count"]
                                        }, this.retrieve_tag = function(e) {
                                            if (this.tags[e + "count"]) {
                                                for (var t = this.tags.parent; t && e + this.tags[e + "count"] !== t;) t = this.tags[t + "parent"];
                                                t && (this.indent_level = this.tags[e + this.tags[e + "count"]], this.tags.parent = this.tags[t + "parent"]), delete this.tags[e + this.tags[e + "count"] + "parent"], delete this.tags[e + this.tags[e + "count"]], 1 === this.tags[e + "count"] ? delete this.tags[e + "count"] : this.tags[e + "count"]--
                                            }
                                        }, this.indent_to_tag = function(e) {
                                            if (this.tags[e + "count"]) {
                                                for (var t = this.tags.parent; t && e + this.tags[e + "count"] !== t;) t = this.tags[t + "parent"];
                                                t && (this.indent_level = this.tags[e + this.tags[e + "count"]])
                                            }
                                        }, this.get_tag = function(e) {
                                            var t, n, i, r = "",
                                                s = [],
                                                a = "",
                                                _ = !1,
                                                o = !0,
                                                l = !1,
                                                u = this.pos,
                                                c = this.line_char_count,
                                                h = !1;
                                            e = void 0 !== e && e;
                                            do {
                                                if (this.pos >= this.input.length) return e && (this.pos = u, this.line_char_count = c), s.length ? s.join("") : ["", "TK_EOF"];
                                                if (r = this.input.charAt(this.pos), this.pos++, this.Utils.in_array(r, this.Utils.whitespace)) _ = !0;
                                                else {
                                                    if ("'" !== r && '"' !== r || (r += this.get_unformatted(r), _ = !0), "=" === r && (_ = !1), i = this.input.substr(this.pos - 1), !k || !l || h || ">" !== r && "/" !== r || i.match(/^\/?\s*>/) && (_ = !1, h = !0, this.print_newline(!1, s), this.print_indentation(s)), s.length && "=" !== s[s.length - 1] && ">" !== r && _) {
                                                        var p = this.space_or_wrap(s) && "/" !== r && !v;
                                                        if (_ = !1, v && "/" !== r) {
                                                            var f = !1;
                                                            k && o && (f = !(null !== i.match(/^\S*(="([^"]|\\")*")?\s*\/?\s*>/))), o && !f || (this.print_newline(!1, s), this.print_indentation(s), p = !0)
                                                        }
                                                        if (p) {
                                                            l = !0;
                                                            var d = w;
                                                            y && (d = s.indexOf(" ") + 1);
                                                            for (var m = 0; m < d; m++) s.push(" ")
                                                        }
                                                        if (o)
                                                            for (var x = 0; x < s.length; x++)
                                                                if (" " === s[x]) {
                                                                    o = !1;
                                                                    break
                                                                }
                                                    }
                                                    if (E && "<" === n && r + this.input.charAt(this.pos) === "{{" && (r += this.get_unformatted("}}"), s.length && " " !== s[s.length - 1] && "<" !== s[s.length - 1] && (r = " " + r), _ = !0), "<" !== r || n || (t = this.pos - 1, n = "<"), E && !n && s.length >= 2 && "{" === s[s.length - 1] && "{" === s[s.length - 2] && (t = "#" === r || "/" === r || "!" === r ? this.pos - 3 : this.pos - 2, n = "{"), this.line_char_count++, s.push(r), s[1] && ("!" === s[1] || "?" === s[1] || "%" === s[1])) {
                                                        s = [this.get_comment(t)];
                                                        break
                                                    }
                                                    if (E && s[1] && "{" === s[1] && s[2] && "!" === s[2]) {
                                                        s = [this.get_comment(t)];
                                                        break
                                                    }
                                                    if (E && "{" === n && s.length > 2 && "}" === s[s.length - 2] && "}" === s[s.length - 1]) break
                                                }
                                            } while (">" !== r);
                                            var b, R, K = s.join("");
                                            b = -1 !== K.indexOf(" ") ? K.indexOf(" ") : -1 !== K.indexOf("\n") ? K.indexOf("\n") : "{" === K.charAt(0) ? K.indexOf("}") : K.indexOf(">"), R = "<" !== K.charAt(0) && E ? "#" === K.charAt(2) ? 3 : 2 : 1;
                                            var O = K.substring(R, b).toLowerCase();
                                            return "/" === K.charAt(K.length - 2) || this.Utils.in_array(O, this.Utils.single_token) ? e || (this.tag_type = "SINGLE") : E && "{" === K.charAt(0) && "else" === O ? e || (this.indent_to_tag("if"), this.tag_type = "HANDLEBARS_ELSE", this.indent_content = !0, this.traverse_whitespace()) : this.is_unformatted(O, T) || this.is_unformatted(O, g) ? (a = this.get_unformatted("</" + O + ">", K), s.push(a), this.pos, this.tag_type = "SINGLE") : "script" === O && (-1 === K.search("type") || K.search("type") > -1 && K.search(/\b(text|application|dojo)\/(x-)?(javascript|ecmascript|jscript|livescript|(ld\+)?json|method|aspect)/) > -1) ? e || (this.record_tag(O), this.tag_type = "SCRIPT") : "style" === O && (-1 === K.search("type") || K.search("type") > -1 && K.search("text/css") > -1) ? e || (this.record_tag(O), this.tag_type = "STYLE") : "!" === O.charAt(0) ? e || (this.tag_type = "SINGLE", this.traverse_whitespace()) : e || ("/" === O.charAt(0) ? (this.retrieve_tag(O.substring(1)), this.tag_type = "END") : (this.record_tag(O), "html" !== O.toLowerCase() && (this.indent_content = !0), this.tag_type = "START"), this.traverse_whitespace() && this.space_or_wrap(s), this.Utils.in_array(O, this.Utils.extra_liners) && (this.print_newline(!1, this.output), this.output.length && "\n" !== this.output[this.output.length - 2] && this.print_newline(!0, this.output))), e && (this.pos = u, this.line_char_count = c), s.join("")
                                        }, this.get_comment = function(e) {
                                            var t = "",
                                                n = ">",
                                                i = !1;
                                            this.pos = e;
                                            var r = this.input.charAt(this.pos);
                                            for (this.pos++; this.pos <= this.input.length && ((t += r).charAt(t.length - 1) !== n.charAt(n.length - 1) || -1 === t.indexOf(n));) !i && t.length < 10 && (0 === t.indexOf("<![if") ? (n = "<![endif]>", i = !0) : 0 === t.indexOf("<![cdata[") ? (n = "]]>", i = !0) : 0 === t.indexOf("<![") ? (n = "]>", i = !0) : 0 === t.indexOf("\x3c!--") ? (n = "--\x3e", i = !0) : 0 === t.indexOf("{{!--") ? (n = "--}}", i = !0) : 0 === t.indexOf("{{!") ? 5 === t.length && -1 === t.indexOf("{{!--") && (n = "}}", i = !0) : 0 === t.indexOf("<?") ? (n = "?>", i = !0) : 0 === t.indexOf("<%") && (n = "%>", i = !0)), r = this.input.charAt(this.pos), this.pos++;
                                            return t
                                        }, this.get_unformatted = function(e, t) {
                                            if (t && -1 !== t.toLowerCase().indexOf(e)) return "";
                                            var n, i, r = "",
                                                s = "",
                                                a = !0,
                                                _ = (n = e, i = "", {
                                                    add: function(e) {
                                                        var t = i + e.toLowerCase();
                                                        i = t.length <= n.length ? t : t.substr(t.length - n.length, n.length)
                                                    },
                                                    doesNotMatch: function() {
                                                        return -1 === i.indexOf(n)
                                                    }
                                                });
                                            do {
                                                if (this.pos >= this.input.length) return s;
                                                if (r = this.input.charAt(this.pos), this.pos++, this.Utils.in_array(r, this.Utils.whitespace)) {
                                                    if (!a) {
                                                        this.line_char_count--;
                                                        continue
                                                    }
                                                    if ("\n" === r || "\r" === r) {
                                                        s += "\n", this.line_char_count = 0;
                                                        continue
                                                    }
                                                }
                                                s += r, _.add(r), this.line_char_count++, a = !0, E && "{" === r && s.length && "{" === s.charAt(s.length - 2) && (s += this.get_unformatted("}}"))
                                            } while (_.doesNotMatch());
                                            return s
                                        }, this.get_token = function() {
                                            var e;
                                            if ("TK_TAG_SCRIPT" === this.last_token || "TK_TAG_STYLE" === this.last_token) {
                                                var t = this.last_token.substr(7);
                                                return "string" != typeof(e = this.get_contents_to(t)) ? e : [e, "TK_" + t]
                                            }
                                            return "CONTENT" === this.current_mode ? "string" != typeof(e = this.get_content()) ? e : [e, "TK_CONTENT"] : "TAG" === this.current_mode ? "string" != typeof(e = this.get_tag()) ? e : [e, "TK_TAG_" + this.tag_type] : void 0
                                        }, this.get_full_indent = function(e) {
                                            return (e = this.indent_level + e || 0) < 1 ? "" : Array(e + 1).join(this.indent_string)
                                        }, this.is_unformatted = function(e, t) {
                                            if (!this.Utils.in_array(e, t)) return !1;
                                            if ("a" !== e.toLowerCase() || !this.Utils.in_array("a", t)) return !0;
                                            var n = (this.get_tag(!0) || "").match(/^\s*<\s*\/?([a-z]*)\s*[^>]*>\s*$/);
                                            return !(n && !this.Utils.in_array(n[1], t))
                                        }, this.printer = function(e, t, n, i, r) {
                                            this.input = e || "", this.input = this.input.replace(/\r\n|[\r\u2028\u2029]/g, "\n"), this.output = [], this.indent_character = t, this.indent_string = "", this.indent_size = n, this.brace_style = r, this.indent_level = 0, this.wrap_line_length = i, this.line_char_count = 0;
                                            for (var s = 0; s < this.indent_size; s++) this.indent_string += this.indent_character;
                                            this.print_newline = function(e, t) {
                                                this.line_char_count = 0, t && t.length && (e || "\n" !== t[t.length - 1]) && ("\n" !== t[t.length - 1] && (t[t.length - 1] = _(t[t.length - 1])), t.push("\n"))
                                            }, this.print_indentation = function(e) {
                                                for (var t = 0; t < this.indent_level; t++) e.push(this.indent_string), this.line_char_count += this.indent_string.length
                                            }, this.print_token = function(e) {
                                                this.is_whitespace(e) && !this.output.length || ((e || "" !== e) && this.output.length && "\n" === this.output[this.output.length - 1] && (this.print_indentation(this.output), e = e.replace(/^\s+/g, "")), this.print_token_raw(e))
                                            }, this.print_token_raw = function(e) {
                                                this.newlines > 0 && (e = _(e)), e && "" !== e && (e.length > 1 && "\n" === e.charAt(e.length - 1) ? (this.output.push(e.slice(0, -1)), this.print_newline(!1, this.output)) : this.output.push(e));
                                                for (var t = 0; t < this.newlines; t++) this.print_newline(t > 0, this.output);
                                                this.newlines = 0
                                            }, this.indent = function() {
                                                this.indent_level++
                                            }, this.unindent = function() {
                                                this.indent_level > 0 && this.indent_level--
                                            }
                                        }, this
                                    }).printer(e, p, h, f, d);;) {
                                    var i = o.get_token();
                                    if (o.token_text = i[0], o.token_type = i[1], "TK_EOF" === o.token_type) break;
                                    switch (o.token_type) {
                                        case "TK_TAG_START":
                                            o.print_newline(!1, o.output), o.print_token(o.token_text), o.indent_content && (!o.indent_body_inner_html && o.token_text.match(/<body(?:.*)>/) || !o.indent_head_inner_html && o.token_text.match(/<head(?:.*)>/) || o.indent(), o.indent_content = !1), o.current_mode = "CONTENT";
                                            break;
                                        case "TK_TAG_STYLE":
                                        case "TK_TAG_SCRIPT":
                                            o.print_newline(!1, o.output), o.print_token(o.token_text), o.current_mode = "CONTENT";
                                            break;
                                        case "TK_TAG_END":
                                            if ("TK_CONTENT" === o.last_token && "" === o.last_text) {
                                                var s = (o.token_text.match(/\w+/) || [])[0],
                                                    a = null;
                                                o.output.length && (a = o.output[o.output.length - 1].match(/(?:<|{{#)\s*(\w+)/)), (null === a || a[1] !== s && !o.Utils.in_array(a[1], T)) && o.print_newline(!1, o.output)
                                            }
                                            o.print_token(o.token_text), o.current_mode = "CONTENT";
                                            break;
                                        case "TK_TAG_SINGLE":
                                            var b = o.token_text.match(/^\s*<([a-z-]+)/i);
                                            b && o.Utils.in_array(b[1], T) || o.print_newline(!1, o.output), o.print_token(o.token_text), o.current_mode = "CONTENT";
                                            break;
                                        case "TK_TAG_HANDLEBARS_ELSE":
                                            for (var S = !1, A = o.output.length - 1; A >= 0 && "\n" !== o.output[A]; A--)
                                                if (o.output[A].match(/{{#if/)) {
                                                    S = !0;
                                                    break
                                                }
                                            S || o.print_newline(!1, o.output), o.print_token(o.token_text), o.indent_content && (o.indent(), o.indent_content = !1), o.current_mode = "CONTENT";
                                            break;
                                        case "TK_TAG_HANDLEBARS_COMMENT":
                                        case "TK_CONTENT":
                                            o.print_token(o.token_text), o.current_mode = "TAG";
                                            break;
                                        case "TK_STYLE":
                                        case "TK_SCRIPT":
                                            if ("" !== o.token_text) {
                                                o.print_newline(!1, o.output);
                                                var C, N = o.token_text,
                                                    D = 1;
                                                "TK_SCRIPT" === o.token_type ? C = "function" == typeof n && n : "TK_STYLE" === o.token_type && (C = "function" == typeof r && r), "keep" === t.indent_scripts ? D = 0 : "separate" === t.indent_scripts && (D = -o.indent_level);
                                                var L = o.get_full_indent(D);
                                                if (C) {
                                                    var j = function() {
                                                        this.eol = "\n"
                                                    };
                                                    j.prototype = t;
                                                    var I = new j;
                                                    N = C(N.replace(/^\s*/, L), I)
                                                } else {
                                                    var B = N.match(/^\s*/)[0].match(/[^\n\r]*$/)[0].split(o.indent_string).length - 1,
                                                        P = o.get_full_indent(D - B);
                                                    N = N.replace(/^\s*/, L).replace(/\r\n|\r|\n/g, "\n" + P).replace(/\s+$/, "")
                                                }
                                                N && (o.print_token_raw(N), o.print_newline(!0, o.output))
                                            }
                                            o.current_mode = "TAG";
                                            break;
                                        default:
                                            "" !== o.token_text && o.print_token(o.token_text)
                                    }
                                    o.last_token = o.token_type, o.last_text = o.token_text
                                }
                                var M = o.output.join("").replace(/[\r\n\t ]+$/, "");
                                return R && (M += "\n"), "\n" !== O && (M = M.replace(/[\n]/g, O)), M
                            }
                        }
                    }, function(e, t) {
                        var n = "ªµºÀ-ÖØ-öø-ˁˆ-ˑˠ-ˤˬˮͰ-ʹͶͷͺ-ͽΆΈ-ΊΌΎ-ΡΣ-ϵϷ-ҁҊ-ԧԱ-Ֆՙա-ևא-תװ-ײؠ-يٮٯٱ-ۓەۥۦۮۯۺ-ۼۿܐܒ-ܯݍ-ޥޱߊ-ߪߴߵߺࠀ-ࠕࠚࠤࠨࡀ-ࡘࢠࢢ-ࢬऄ-हऽॐक़-ॡॱ-ॷॹ-ॿঅ-ঌএঐও-নপ-রলশ-হঽৎড়ঢ়য়-ৡৰৱਅ-ਊਏਐਓ-ਨਪ-ਰਲਲ਼ਵਸ਼ਸਹਖ਼-ੜਫ਼ੲ-ੴઅ-ઍએ-ઑઓ-નપ-રલળવ-હઽૐૠૡଅ-ଌଏଐଓ-ନପ-ରଲଳଵ-ହଽଡ଼ଢ଼ୟ-ୡୱஃஅ-ஊஎ-ஐஒ-கஙசஜஞடணதந-பம-ஹௐఅ-ఌఎ-ఐఒ-నప-ళవ-హఽౘౙౠౡಅ-ಌಎ-ಐಒ-ನಪ-ಳವ-ಹಽೞೠೡೱೲഅ-ഌഎ-ഐഒ-ഺഽൎൠൡൺ-ൿඅ-ඖක-නඳ-රලව-ෆก-ะาำเ-ๆກຂຄງຈຊຍດ-ທນ-ຟມ-ຣລວສຫອ-ະາຳຽເ-ໄໆໜ-ໟༀཀ-ཇཉ-ཬྈ-ྌက-ဪဿၐ-ၕၚ-ၝၡၥၦၮ-ၰၵ-ႁႎႠ-ჅჇჍა-ჺჼ-ቈቊ-ቍቐ-ቖቘቚ-ቝበ-ኈኊ-ኍነ-ኰኲ-ኵኸ-ኾዀዂ-ዅወ-ዖዘ-ጐጒ-ጕጘ-ፚᎀ-ᎏᎠ-Ᏼᐁ-ᙬᙯ-ᙿᚁ-ᚚᚠ-ᛪᛮ-ᛰᜀ-ᜌᜎ-ᜑᜠ-ᜱᝀ-ᝑᝠ-ᝬᝮ-ᝰក-ឳៗៜᠠ-ᡷᢀ-ᢨᢪᢰ-ᣵᤀ-ᤜᥐ-ᥭᥰ-ᥴᦀ-ᦫᧁ-ᧇᨀ-ᨖᨠ-ᩔᪧᬅ-ᬳᭅ-ᭋᮃ-ᮠᮮᮯᮺ-ᯥᰀ-ᰣᱍ-ᱏᱚ-ᱽᳩ-ᳬᳮ-ᳱᳵᳶᴀ-ᶿḀ-ἕἘ-Ἕἠ-ὅὈ-Ὅὐ-ὗὙὛὝὟ-ώᾀ-ᾴᾶ-ᾼιῂ-ῄῆ-ῌῐ-ΐῖ-Ίῠ-Ῥῲ-ῴῶ-ῼⁱⁿₐ-ₜℂℇℊ-ℓℕℙ-ℝℤΩℨK-ℭℯ-ℹℼ-ℿⅅ-ⅉⅎⅠ-ↈⰀ-Ⱞⰰ-ⱞⱠ-ⳤⳫ-ⳮⳲⳳⴀ-ⴥⴧⴭⴰ-ⵧⵯⶀ-ⶖⶠ-ⶦⶨ-ⶮⶰ-ⶶⶸ-ⶾⷀ-ⷆⷈ-ⷎⷐ-ⷖⷘ-ⷞⸯ々-〇〡-〩〱-〵〸-〼ぁ-ゖゝ-ゟァ-ヺー-ヿㄅ-ㄭㄱ-ㆎㆠ-ㆺㇰ-ㇿ㐀-䶵一-鿌ꀀ-ꒌꓐ-ꓽꔀ-ꘌꘐ-ꘟꘪꘫꙀ-ꙮꙿ-ꚗꚠ-ꛯꜗ-ꜟꜢ-ꞈꞋ-ꞎꞐ-ꞓꞠ-Ɦꟸ-ꠁꠃ-ꠅꠇ-ꠊꠌ-ꠢꡀ-ꡳꢂ-ꢳꣲ-ꣷꣻꤊ-ꤥꤰ-ꥆꥠ-ꥼꦄ-ꦲꧏꨀ-ꨨꩀ-ꩂꩄ-ꩋꩠ-ꩶꩺꪀ-ꪯꪱꪵꪶꪹ-ꪽꫀꫂꫛ-ꫝꫠ-ꫪꫲ-ꫴꬁ-ꬆꬉ-ꬎꬑ-ꬖꬠ-ꬦꬨ-ꬮꯀ-ꯢ가-힣ힰ-ퟆퟋ-ퟻ豈-舘並-龎ﬀ-ﬆﬓ-ﬗיִײַ-ﬨשׁ-זּטּ-לּמּנּסּףּפּצּ-ﮱﯓ-ﴽﵐ-ﶏﶒ-ﷇﷰ-ﷻﹰ-ﹴﹶ-ﻼＡ-Ｚａ-ｚｦ-ﾾￂ-ￇￊ-ￏￒ-ￗￚ-ￜ",
                            i = new RegExp("[" + n + "]"),
                            r = new RegExp("[" + n + "̀-ͯ҃-֑҇-ׇֽֿׁׂׅׄؐ-ؚؠ-ىٲ-ۓۧ-ۨۻ-ۼܰ-݊ࠀ-ࠔࠛ-ࠣࠥ-ࠧࠩ-࠭ࡀ-ࡗࣤ-ࣾऀ-ःऺ-़ा-ॏ॑-ॗॢ-ॣ०-९ঁ-ঃ়া-ৄেৈৗয়-ৠਁ-ਃ਼ਾ-ੂੇੈੋ-੍ੑ੦-ੱੵઁ-ઃ઼ા-ૅે-ૉો-્ૢ-ૣ૦-૯ଁ-ଃ଼ା-ୄେୈୋ-୍ୖୗୟ-ୠ୦-୯ஂா-ூெ-ைொ-்ௗ௦-௯ఁ-ఃె-ైొ-్ౕౖౢ-ౣ౦-౯ಂಃ಼ಾ-ೄೆ-ೈೊ-್ೕೖೢ-ೣ೦-೯ംഃെ-ൈൗൢ-ൣ൦-൯ංඃ්ා-ුූෘ-ෟෲෳิ-ฺเ-ๅ๐-๙ິ-ູ່-ໍ໐-໙༘༙༠-༩༹༵༷ཁ-ཇཱ-྄྆-྇ྍ-ྗྙ-ྼ࿆က-ဩ၀-၉ၧ-ၭၱ-ၴႂ-ႍႏ-ႝ፝-፟ᜎ-ᜐᜠ-ᜰᝀ-ᝐᝲᝳក-ឲ៝០-៩᠋-᠍᠐-᠙ᤠ-ᤫᤰ-᤻ᥑ-ᥭᦰ-ᧀᧈ-ᧉ᧐-᧙ᨀ-ᨕᨠ-ᩓ᩠-᩿᩼-᪉᪐-᪙ᭆ-ᭋ᭐-᭙᭫-᭳᮰-᮹᯦-᯳ᰀ-ᰢ᱀-᱉ᱛ-ᱽ᳐-᳒ᴀ-ᶾḁ-ἕ‌‍‿⁀⁔⃐-⃥⃜⃡-⃰ⶁ-ⶖⷠ-ⷿ〡-〨゙゚Ꙁ-ꙭꙴ-꙽ꚟ꛰-꛱ꟸ-ꠀ꠆ꠋꠣ-ꠧꢀ-ꢁꢴ-꣄꣐-꣙ꣳ-ꣷ꤀-꤉ꤦ-꤭ꤰ-ꥅꦀ-ꦃ꦳-꧀ꨀ-ꨧꩀ-ꩁꩌ-ꩍ꩐-꩙ꩻꫠ-ꫩꫲ-ꫳꯀ-ꯡ꯬꯭꯰-꯹ﬠ-ﬨ︀-️︠-︦︳︴﹍-﹏０-９＿]");
                        t.newline = /[\n\r\u2028\u2029]/, t.lineBreak = new RegExp("\r\n|" + t.newline.source), t.allLineBreaks = new RegExp(t.lineBreak.source, "g"), t.isIdentifierStart = function(e) {
                            return e < 65 ? 36 === e || 64 === e : e < 91 || (e < 97 ? 95 === e : e < 123 || e >= 170 && i.test(String.fromCharCode(e)))
                        }, t.isIdentifierChar = function(e) {
                            return e < 48 ? 36 === e : e < 58 || !(e < 65) && (e < 91 || (e < 97 ? 95 === e : e < 123 || e >= 170 && r.test(String.fromCharCode(e))))
                        }
                    }, function(e, t) {
                        e.exports.mergeOpts = function(e, t) {
                            var n, i = {};
                            for (n in e) n !== t && (i[n] = e[n]);
                            if (t in e)
                                for (n in e[t]) i[n] = e[t][n];
                            return i
                        }
                    }, function(e, t, n) {
                        var i = n(0).Beautifier;
                        e.exports = function(e, t, n, r) {
                            return new i(e, t, n, r).beautify()
                        }
                    }]);
                    if (void 0 !== n) {
                        var r = e("./beautify.js"),
                            s = e("./beautify-css.js");
                        n.html_beautify = function(e, t) {
                            return i(e, t, r.js_beautify, s.css_beautify)
                        }
                    } else "undefined" != typeof window ? window.html_beautify = function(e, t) {
                        return i(e, t, window.js_beautify, window.css_beautify)
                    } : void 0 !== t && (t.html_beautify = function(e, n) {
                        return i(e, n, t.js_beautify, t.css_beautify)
                    })
                }()
            }).call(this, "undefined" != typeof global ? global : "undefined" != typeof self ? self : "undefined" != typeof window ? window : {})
        }, {
            "./beautify-css.js": 2,
            "./beautify.js": 4
        }],
        4: [function(e, t, n) {
            (function(e) {
                var t;
                t = function(e) {
                    var t = {};

                    function n(i) {
                        if (t[i]) return t[i].exports;
                        var r = t[i] = {
                            i: i,
                            l: !1,
                            exports: {}
                        };
                        return e[i].call(r.exports, r, r.exports, n), r.l = !0, r.exports
                    }
                    return n.m = e, n.c = t, n.i = function(e) {
                        return e
                    }, n.d = function(e, t, i) {
                        n.o(e, t) || Object.defineProperty(e, t, {
                            configurable: !1,
                            enumerable: !0,
                            get: i
                        })
                    }, n.n = function(e) {
                        var t = e && e.__esModule ? function() {
                            return e.default
                        } : function() {
                            return e
                        };
                        return n.d(t, "a", t), t
                    }, n.o = function(e, t) {
                        return Object.prototype.hasOwnProperty.call(e, t)
                    }, n.p = "", n(n.s = 6)
                }([function(e, t) {
                    var n = "ªµºÀ-ÖØ-öø-ˁˆ-ˑˠ-ˤˬˮͰ-ʹͶͷͺ-ͽΆΈ-ΊΌΎ-ΡΣ-ϵϷ-ҁҊ-ԧԱ-Ֆՙա-ևא-תװ-ײؠ-يٮٯٱ-ۓەۥۦۮۯۺ-ۼۿܐܒ-ܯݍ-ޥޱߊ-ߪߴߵߺࠀ-ࠕࠚࠤࠨࡀ-ࡘࢠࢢ-ࢬऄ-हऽॐक़-ॡॱ-ॷॹ-ॿঅ-ঌএঐও-নপ-রলশ-হঽৎড়ঢ়য়-ৡৰৱਅ-ਊਏਐਓ-ਨਪ-ਰਲਲ਼ਵਸ਼ਸਹਖ਼-ੜਫ਼ੲ-ੴઅ-ઍએ-ઑઓ-નપ-રલળવ-હઽૐૠૡଅ-ଌଏଐଓ-ନପ-ରଲଳଵ-ହଽଡ଼ଢ଼ୟ-ୡୱஃஅ-ஊஎ-ஐஒ-கஙசஜஞடணதந-பம-ஹௐఅ-ఌఎ-ఐఒ-నప-ళవ-హఽౘౙౠౡಅ-ಌಎ-ಐಒ-ನಪ-ಳವ-ಹಽೞೠೡೱೲഅ-ഌഎ-ഐഒ-ഺഽൎൠൡൺ-ൿඅ-ඖක-නඳ-රලව-ෆก-ะาำเ-ๆກຂຄງຈຊຍດ-ທນ-ຟມ-ຣລວສຫອ-ະາຳຽເ-ໄໆໜ-ໟༀཀ-ཇཉ-ཬྈ-ྌက-ဪဿၐ-ၕၚ-ၝၡၥၦၮ-ၰၵ-ႁႎႠ-ჅჇჍა-ჺჼ-ቈቊ-ቍቐ-ቖቘቚ-ቝበ-ኈኊ-ኍነ-ኰኲ-ኵኸ-ኾዀዂ-ዅወ-ዖዘ-ጐጒ-ጕጘ-ፚᎀ-ᎏᎠ-Ᏼᐁ-ᙬᙯ-ᙿᚁ-ᚚᚠ-ᛪᛮ-ᛰᜀ-ᜌᜎ-ᜑᜠ-ᜱᝀ-ᝑᝠ-ᝬᝮ-ᝰក-ឳៗៜᠠ-ᡷᢀ-ᢨᢪᢰ-ᣵᤀ-ᤜᥐ-ᥭᥰ-ᥴᦀ-ᦫᧁ-ᧇᨀ-ᨖᨠ-ᩔᪧᬅ-ᬳᭅ-ᭋᮃ-ᮠᮮᮯᮺ-ᯥᰀ-ᰣᱍ-ᱏᱚ-ᱽᳩ-ᳬᳮ-ᳱᳵᳶᴀ-ᶿḀ-ἕἘ-Ἕἠ-ὅὈ-Ὅὐ-ὗὙὛὝὟ-ώᾀ-ᾴᾶ-ᾼιῂ-ῄῆ-ῌῐ-ΐῖ-Ίῠ-Ῥῲ-ῴῶ-ῼⁱⁿₐ-ₜℂℇℊ-ℓℕℙ-ℝℤΩℨK-ℭℯ-ℹℼ-ℿⅅ-ⅉⅎⅠ-ↈⰀ-Ⱞⰰ-ⱞⱠ-ⳤⳫ-ⳮⳲⳳⴀ-ⴥⴧⴭⴰ-ⵧⵯⶀ-ⶖⶠ-ⶦⶨ-ⶮⶰ-ⶶⶸ-ⶾⷀ-ⷆⷈ-ⷎⷐ-ⷖⷘ-ⷞⸯ々-〇〡-〩〱-〵〸-〼ぁ-ゖゝ-ゟァ-ヺー-ヿㄅ-ㄭㄱ-ㆎㆠ-ㆺㇰ-ㇿ㐀-䶵一-鿌ꀀ-ꒌꓐ-ꓽꔀ-ꘌꘐ-ꘟꘪꘫꙀ-ꙮꙿ-ꚗꚠ-ꛯꜗ-ꜟꜢ-ꞈꞋ-ꞎꞐ-ꞓꞠ-Ɦꟸ-ꠁꠃ-ꠅꠇ-ꠊꠌ-ꠢꡀ-ꡳꢂ-ꢳꣲ-ꣷꣻꤊ-ꤥꤰ-ꥆꥠ-ꥼꦄ-ꦲꧏꨀ-ꨨꩀ-ꩂꩄ-ꩋꩠ-ꩶꩺꪀ-ꪯꪱꪵꪶꪹ-ꪽꫀꫂꫛ-ꫝꫠ-ꫪꫲ-ꫴꬁ-ꬆꬉ-ꬎꬑ-ꬖꬠ-ꬦꬨ-ꬮꯀ-ꯢ가-힣ힰ-ퟆퟋ-ퟻ豈-舘並-龎ﬀ-ﬆﬓ-ﬗיִײַ-ﬨשׁ-זּטּ-לּמּנּסּףּפּצּ-ﮱﯓ-ﴽﵐ-ﶏﶒ-ﷇﷰ-ﷻﹰ-ﹴﹶ-ﻼＡ-Ｚａ-ｚｦ-ﾾￂ-ￇￊ-ￏￒ-ￗￚ-ￜ",
                        i = new RegExp("[" + n + "]"),
                        r = new RegExp("[" + n + "̀-ͯ҃-֑҇-ׇֽֿׁׂׅׄؐ-ؚؠ-ىٲ-ۓۧ-ۨۻ-ۼܰ-݊ࠀ-ࠔࠛ-ࠣࠥ-ࠧࠩ-࠭ࡀ-ࡗࣤ-ࣾऀ-ःऺ-़ा-ॏ॑-ॗॢ-ॣ०-९ঁ-ঃ়া-ৄেৈৗয়-ৠਁ-ਃ਼ਾ-ੂੇੈੋ-੍ੑ੦-ੱੵઁ-ઃ઼ા-ૅે-ૉો-્ૢ-ૣ૦-૯ଁ-ଃ଼ା-ୄେୈୋ-୍ୖୗୟ-ୠ୦-୯ஂா-ூெ-ைொ-்ௗ௦-௯ఁ-ఃె-ైొ-్ౕౖౢ-ౣ౦-౯ಂಃ಼ಾ-ೄೆ-ೈೊ-್ೕೖೢ-ೣ೦-೯ംഃെ-ൈൗൢ-ൣ൦-൯ංඃ්ා-ුූෘ-ෟෲෳิ-ฺเ-ๅ๐-๙ິ-ູ່-ໍ໐-໙༘༙༠-༩༹༵༷ཁ-ཇཱ-྄྆-྇ྍ-ྗྙ-ྼ࿆က-ဩ၀-၉ၧ-ၭၱ-ၴႂ-ႍႏ-ႝ፝-፟ᜎ-ᜐᜠ-ᜰᝀ-ᝐᝲᝳក-ឲ៝០-៩᠋-᠍᠐-᠙ᤠ-ᤫᤰ-᤻ᥑ-ᥭᦰ-ᧀᧈ-ᧉ᧐-᧙ᨀ-ᨕᨠ-ᩓ᩠-᩿᩼-᪉᪐-᪙ᭆ-ᭋ᭐-᭙᭫-᭳᮰-᮹᯦-᯳ᰀ-ᰢ᱀-᱉ᱛ-ᱽ᳐-᳒ᴀ-ᶾḁ-ἕ‌‍‿⁀⁔⃐-⃥⃜⃡-⃰ⶁ-ⶖⷠ-ⷿ〡-〨゙゚Ꙁ-ꙭꙴ-꙽ꚟ꛰-꛱ꟸ-ꠀ꠆ꠋꠣ-ꠧꢀ-ꢁꢴ-꣄꣐-꣙ꣳ-ꣷ꤀-꤉ꤦ-꤭ꤰ-ꥅꦀ-ꦃ꦳-꧀ꨀ-ꨧꩀ-ꩁꩌ-ꩍ꩐-꩙ꩻꫠ-ꫩꫲ-ꫳꯀ-ꯡ꯬꯭꯰-꯹ﬠ-ﬨ︀-️︠-︦︳︴﹍-﹏０-９＿]");
                    t.newline = /[\n\r\u2028\u2029]/, t.lineBreak = new RegExp("\r\n|" + t.newline.source), t.allLineBreaks = new RegExp(t.lineBreak.source, "g"), t.isIdentifierStart = function(e) {
                        return e < 65 ? 36 === e || 64 === e : e < 91 || (e < 97 ? 95 === e : e < 123 || e >= 170 && i.test(String.fromCharCode(e)))
                    }, t.isIdentifierChar = function(e) {
                        return e < 48 ? 36 === e : e < 58 || !(e < 65) && (e < 91 || (e < 97 ? 95 === e : e < 123 || e >= 170 && r.test(String.fromCharCode(e))))
                    }
                }, function(e, t, n) {
                    var i = n(3).mergeOpts,
                        r = n(0),
                        s = n(4).Output,
                        a = n(7).Tokenizer;

                    function _(e, t) {
                        if (!t.multiline_frame && t.mode !== h.ForInitializer && t.mode !== h.Conditional) {
                            var n = t.start_line_index;
                            e.remove_indent(n)
                        }
                    }

                    function o(e, t) {
                        for (var n = 0; n < t.length; n += 1)
                            if (t[n] === e) return !0;
                        return !1
                    }
                    var l = ["before-newline", "after-newline", "preserve-newline"],
                        u = function(e) {
                            for (var t = {}, n = 0; n < e.length; n++) t[e[n].replace(/-/g, "_")] = e[n];
                            return t
                        }(l),
                        c = [u.before_newline, u.preserve_newline],
                        h = {
                            BlockStatement: "BlockStatement",
                            Statement: "Statement",
                            ObjectLiteral: "ObjectLiteral",
                            ArrayLiteral: "ArrayLiteral",
                            ForInitializer: "ForInitializer",
                            Conditional: "Conditional",
                            Expression: "Expression"
                        };
                    e.exports.Beautifier = function(e, t) {
                        "use strict";
                        var n, p, f, d, T, g, m, x, E, b, w, v, k, y = [],
                            R = "";

                        function K(e, t) {
                            var i = 0;
                            return e && (i = e.indentation_level, !n.just_added_newline() && e.line_indent_level > i && (i = e.line_indent_level)), {
                                mode: t,
                                parent: e,
                                last_text: e ? e.last_text : "",
                                last_word: e ? e.last_word : "",
                                declaration_statement: !1,
                                declaration_assignment: !1,
                                multiline_frame: !1,
                                inline_frame: !1,
                                if_block: !1,
                                else_block: !1,
                                do_block: !1,
                                do_while: !1,
                                import_block: !1,
                                in_case_statement: !1,
                                in_case: !1,
                                case_body: !1,
                                indentation_level: i,
                                line_indent_level: e ? e.line_indent_level : i,
                                start_line_index: n.get_line_number(),
                                ternary_depth: 0
                            }
                        }
                        v = {
                            TK_START_EXPR: function() {
                                W() || C(d);
                                var e = h.Expression;
                                if ("[" === d.text) {
                                    if ("TK_WORD" === T || ")" === x.last_text) return "TK_RESERVED" === T && o(x.last_text, f.line_starters) && (n.space_before_token = !0), P(e), I(), B(), void(k.space_in_paren && (n.space_before_token = !0));
                                    e = h.ArrayLiteral, M(x.mode) && ("[" !== x.last_text && ("," !== x.last_text || "]" !== g && "}" !== g) || k.keep_array_indentation || L())
                                } else "TK_RESERVED" === T && "for" === x.last_text ? e = h.ForInitializer : "TK_RESERVED" === T && o(x.last_text, ["if", "while"]) && (e = h.Conditional);
                                ";" === x.last_text || "TK_START_BLOCK" === T ? L() : "TK_END_EXPR" === T || "TK_START_EXPR" === T || "TK_END_BLOCK" === T || "." === x.last_text ? D(d.wanted_newline) : "TK_RESERVED" === T && "(" === d.text || "TK_WORD" === T || "TK_OPERATOR" === T ? "TK_RESERVED" === T && ("function" === x.last_word || "typeof" === x.last_word) || "*" === x.last_text && (o(g, ["function", "yield"]) || x.mode === h.ObjectLiteral && o(g, ["{", ","])) ? k.space_after_anon_function && (n.space_before_token = !0) : "TK_RESERVED" !== T || !o(x.last_text, f.line_starters) && "catch" !== x.last_text || k.space_before_conditional && (n.space_before_token = !0) : n.space_before_token = !0, "(" === d.text && "TK_RESERVED" === T && o(x.last_word, ["await", "async"]) && (n.space_before_token = !0), "(" === d.text && ("TK_EQUALS" !== T && "TK_OPERATOR" !== T || z() || D()), "(" === d.text && "TK_WORD" !== T && "TK_RESERVED" !== T && D(), P(e), I(), k.space_in_paren && (n.space_before_token = !0), B()
                            },
                            TK_END_EXPR: function() {
                                for (; x.mode === h.Statement;) U();
                                C(d), x.multiline_frame && D("]" === d.text && M(x.mode) && !k.keep_array_indentation), k.space_in_paren && ("TK_START_EXPR" !== T || k.space_in_empty_paren ? n.space_before_token = !0 : (n.trim(), n.space_before_token = !1)), "]" === d.text && k.keep_array_indentation ? (I(), U()) : (U(), I()), _(n, E), x.do_while && E.mode === h.Conditional && (E.mode = h.Expression, x.do_block = !1, x.do_while = !1)
                            },
                            TK_START_BLOCK: function() {
                                C(d);
                                var e = X(1),
                                    t = X(2);
                                t && (o(t.text, [":", ","]) && o(e.type, ["TK_STRING", "TK_WORD", "TK_RESERVED"]) || o(e.text, ["get", "set", "..."]) && o(t.type, ["TK_WORD", "TK_RESERVED"])) ? o(g, ["class", "interface"]) ? P(h.BlockStatement) : P(h.ObjectLiteral) : "TK_OPERATOR" === T && "=>" === x.last_text ? P(h.BlockStatement) : o(T, ["TK_EQUALS", "TK_START_EXPR", "TK_COMMA", "TK_OPERATOR"]) || "TK_RESERVED" === T && o(x.last_text, ["return", "throw", "import", "default"]) ? P(h.ObjectLiteral) : P(h.BlockStatement);
                                var i = !e.comments_before.length && "}" === e.text && "function" === x.last_word && "TK_END_EXPR" === T;
                                if (k.brace_preserve_inline) {
                                    var r = 0,
                                        s = null;
                                    x.inline_frame = !0;
                                    do {
                                        if ((s = X(r += 1)).wanted_newline) {
                                            x.inline_frame = !1;
                                            break
                                        }
                                    } while ("TK_EOF" !== s.type && ("TK_END_BLOCK" !== s.type || s.opened !== d))
                                }("expand" === k.brace_style || "none" === k.brace_style && d.wanted_newline) && !x.inline_frame ? "TK_OPERATOR" !== T && (i || "TK_EQUALS" === T || "TK_RESERVED" === T && G(x.last_text) && "else" !== x.last_text) ? n.space_before_token = !0 : L(!1, !0) : (!M(E.mode) || "TK_START_EXPR" !== T && "TK_COMMA" !== T || (("TK_COMMA" === T || k.space_in_paren) && (n.space_before_token = !0), ("TK_COMMA" === T || "TK_START_EXPR" === T && x.inline_frame) && (D(), E.multiline_frame = E.multiline_frame || x.multiline_frame, x.multiline_frame = !1)), "TK_OPERATOR" !== T && "TK_START_EXPR" !== T && ("TK_START_BLOCK" !== T || x.inline_frame ? n.space_before_token = !0 : L())), I(), B()
                            },
                            TK_END_BLOCK: function() {
                                for (C(d); x.mode === h.Statement;) U();
                                var e = "TK_START_BLOCK" === T;
                                x.inline_frame && !e ? n.space_before_token = !0 : "expand" === k.brace_style ? e || L() : e || (M(x.mode) && k.keep_array_indentation ? (k.keep_array_indentation = !1, L(), k.keep_array_indentation = !0) : L()), U(), I()
                            },
                            TK_WORD: F,
                            TK_RESERVED: F,
                            TK_SEMICOLON: function() {
                                W() ? n.space_before_token = !1 : C(d);
                                for (var e = X(1); !(x.mode !== h.Statement || x.if_block && e && "TK_RESERVED" === e.type && "else" === e.text || x.do_block);) U();
                                x.import_block && (x.import_block = !1), I()
                            },
                            TK_STRING: function() {
                                W() ? n.space_before_token = !0 : (C(d), "TK_RESERVED" === T || "TK_WORD" === T || x.inline_frame ? n.space_before_token = !0 : "TK_COMMA" === T || "TK_START_EXPR" === T || "TK_EQUALS" === T || "TK_OPERATOR" === T ? z() || D() : L()), I()
                            },
                            TK_EQUALS: function() {
                                W() || C(d), x.declaration_statement && (x.declaration_assignment = !0), n.space_before_token = !0, I(), n.space_before_token = !0
                            },
                            TK_OPERATOR: function() {
                                var e = "*" === d.text && ("TK_RESERVED" === T && o(x.last_text, ["function", "yield"]) || o(T, ["TK_START_BLOCK", "TK_COMMA", "TK_END_BLOCK", "TK_SEMICOLON"])),
                                    t = o(d.text, ["-", "+"]) && (o(T, ["TK_START_BLOCK", "TK_START_EXPR", "TK_EQUALS", "TK_OPERATOR"]) || o(x.last_text, f.line_starters) || "," === x.last_text);
                                if (W());
                                else {
                                    var i = !e;
                                    C(d, i)
                                }
                                if ("TK_RESERVED" === T && G(x.last_text)) return n.space_before_token = !0, void I();
                                if ("*" !== d.text || "TK_DOT" !== T)
                                    if ("::" !== d.text) {
                                        if ("TK_OPERATOR" === T && o(k.operator_position, c) && D(), ":" === d.text && x.in_case) return x.case_body = !0, B(), I(), L(), void(x.in_case = !1);
                                        var r = !0,
                                            s = !0,
                                            a = !1;
                                        if (":" === d.text ? 0 === x.ternary_depth ? r = !1 : (x.ternary_depth -= 1, a = !0) : "?" === d.text && (x.ternary_depth += 1), !t && !e && k.preserve_newlines && o(d.text, f.positionable_operators)) {
                                            var _ = ":" === d.text,
                                                l = _ && a,
                                                p = _ && !a;
                                            switch (k.operator_position) {
                                                case u.before_newline:
                                                    return n.space_before_token = !p, I(), _ && !l || D(), void(n.space_before_token = !0);
                                                case u.after_newline:
                                                    return n.space_before_token = !0, !_ || l ? X(1).wanted_newline ? L(!1, !0) : D() : n.space_before_token = !1, I(), void(n.space_before_token = !0);
                                                case u.preserve_newline:
                                                    return p || D(), r = !(n.just_added_newline() || p), n.space_before_token = r, I(), void(n.space_before_token = !0)
                                            }
                                        }
                                        if (e) {
                                            D(), r = !1;
                                            var g = X(1);
                                            s = g && o(g.type, ["TK_WORD", "TK_RESERVED"])
                                        } else "..." === d.text ? (D(), r = "TK_START_BLOCK" === T, s = !1) : (o(d.text, ["--", "++", "!", "~"]) || t) && (r = !1, s = !1, !d.wanted_newline || "--" !== d.text && "++" !== d.text || L(!1, !0), ";" === x.last_text && V(x.mode) && (r = !0), "TK_RESERVED" === T ? r = !0 : "TK_END_EXPR" === T ? r = !("]" === x.last_text && ("--" === d.text || "++" === d.text)) : "TK_OPERATOR" === T && (r = o(d.text, ["--", "-", "++", "+"]) && o(x.last_text, ["--", "-", "++", "+"]), o(d.text, ["+", "-"]) && o(x.last_text, ["--", "++"]) && (s = !0)), (x.mode !== h.BlockStatement || x.inline_frame) && x.mode !== h.Statement || "{" !== x.last_text && ";" !== x.last_text || L());
                                        n.space_before_token = n.space_before_token || r, I(), n.space_before_token = s
                                    } else I();
                                else I()
                            },
                            TK_COMMA: function() {
                                C(d, !0), I(), n.space_before_token = !0, x.declaration_statement ? (V(x.parent.mode) && (x.declaration_assignment = !1), x.declaration_assignment ? (x.declaration_assignment = !1, L(!1, !0)) : k.comma_first && D()) : x.mode === h.ObjectLiteral || x.mode === h.Statement && x.parent.mode === h.ObjectLiteral ? (x.mode === h.Statement && U(), x.inline_frame || L()) : k.comma_first && D()
                            },
                            TK_BLOCK_COMMENT: function(e) {
                                if (n.raw) return n.add_raw_token(d), void(d.directives && "end" === d.directives.preserve && (n.raw = k.test_output_raw));
                                if (d.directives) return L(!1, e), I(), "start" === d.directives.preserve && (n.raw = !0), void L(!1, !0);
                                if (!r.newline.test(d.text) && !d.wanted_newline) return n.space_before_token = !0, I(), void(n.space_before_token = !0);
                                var t, i = function(e) {
                                        e = e.replace(r.allLineBreaks, "\n");
                                        for (var t = [], n = e.indexOf("\n"); - 1 !== n;) t.push(e.substring(0, n)), e = e.substring(n + 1), n = e.indexOf("\n");
                                        return e.length && t.push(e), t
                                    }(d.text),
                                    s = !1,
                                    a = !1,
                                    _ = d.whitespace_before,
                                    o = _.length;
                                for (L(!1, e), i.length > 1 && (s = function(e, t) {
                                        for (var n = 0; n < e.length; n++) {
                                            var i = e[n].replace(/^\s+|\s+$/g, "");
                                            if (i.charAt(0) !== t) return !1
                                        }
                                        return !0
                                    }(i.slice(1), "*"), a = function(e, t) {
                                        for (var n, i = 0, r = e.length; i < r; i++)
                                            if ((n = e[i]) && 0 !== n.indexOf(t)) return !1;
                                        return !0
                                    }(i.slice(1), _)), I(i[0]), t = 1; t < i.length; t++) L(!1, !0), s ? I(" " + i[t].replace(/^\s+/g, "")) : a && i[t].length > o ? I(i[t].substring(o)) : n.add_token(i[t]);
                                L(!1, e)
                            },
                            TK_COMMENT: function(e) {
                                d.wanted_newline ? L(!1, e) : n.trim(!0), n.space_before_token = !0, I(), L(!1, e)
                            },
                            TK_DOT: function() {
                                W() || C(d, !0), "TK_RESERVED" === T && G(x.last_text) ? n.space_before_token = !0 : D(")" === x.last_text && k.break_chained_methods), I()
                            },
                            TK_UNKNOWN: function(e) {
                                I(), "\n" === d.text[d.text.length - 1] && L(!1, e)
                            },
                            TK_EOF: function() {
                                for (; x.mode === h.Statement;) U();
                                C(d)
                            }
                        }, t = i(t = t || {}, "js"), k = {}, "expand-strict" === t.brace_style ? t.brace_style = "expand" : "collapse-preserve-inline" === t.brace_style ? t.brace_style = "collapse,preserve-inline" : void 0 !== t.braces_on_own_line ? t.brace_style = t.braces_on_own_line ? "expand" : "collapse" : t.brace_style || (t.brace_style = "collapse");
                        var O = t.brace_style.split(/[^a-zA-Z0-9_\-]+/);
                        k.brace_preserve_inline = !1, k.brace_style = "collapse";
                        for (var S = 0; S < O.length; S++) "preserve-inline" === O[S] ? k.brace_preserve_inline = !0 : k.brace_style = O[S];
                        for (k.indent_size = t.indent_size ? parseInt(t.indent_size, 10) : 4, k.indent_char = t.indent_char ? t.indent_char : " ", k.eol = t.eol ? t.eol : "auto", k.preserve_newlines = void 0 === t.preserve_newlines || t.preserve_newlines, k.unindent_chained_methods = void 0 !== t.unindent_chained_methods && t.unindent_chained_methods, k.break_chained_methods = void 0 !== t.break_chained_methods && t.break_chained_methods, k.max_preserve_newlines = void 0 === t.max_preserve_newlines ? 0 : parseInt(t.max_preserve_newlines, 10), k.space_in_paren = void 0 !== t.space_in_paren && t.space_in_paren, k.space_in_empty_paren = void 0 !== t.space_in_empty_paren && t.space_in_empty_paren, k.jslint_happy = void 0 !== t.jslint_happy && t.jslint_happy, k.space_after_anon_function = void 0 !== t.space_after_anon_function && t.space_after_anon_function, k.keep_array_indentation = void 0 !== t.keep_array_indentation && t.keep_array_indentation, k.space_before_conditional = void 0 === t.space_before_conditional || t.space_before_conditional, k.unescape_strings = void 0 !== t.unescape_strings && t.unescape_strings, k.wrap_line_length = void 0 === t.wrap_line_length ? 0 : parseInt(t.wrap_line_length, 10), k.e4x = void 0 !== t.e4x && t.e4x, k.end_with_newline = void 0 !== t.end_with_newline && t.end_with_newline, k.comma_first = void 0 !== t.comma_first && t.comma_first, k.operator_position = function(e) {
                                if (!o(e = e || u.before_newline, l)) throw new Error("Invalid Option Value: The option 'operator_position' must be one of the following values\n" + l + "\nYou passed in: '" + e + "'");
                                return e
                            }(t.operator_position), k.test_output_raw = void 0 !== t.test_output_raw && t.test_output_raw, k.jslint_happy && (k.space_after_anon_function = !0), t.indent_with_tabs && (k.indent_char = "\t", k.indent_size = 1), "auto" === k.eol && (k.eol = "\n", e && r.lineBreak.test(e || "") && (k.eol = e.match(r.lineBreak)[0])), k.eol = k.eol.replace(/\\r/, "\r").replace(/\\n/, "\n"), m = ""; k.indent_size > 0;) m += k.indent_char, k.indent_size -= 1;
                        var A = 0;
                        if (e && e.length) {
                            for (;
                                " " === e.charAt(A) || "\t" === e.charAt(A);) A += 1;
                            R = e.substring(0, A), e = e.substring(A)
                        }

                        function C(e, t) {
                            for (var n = e.newlines, i = k.keep_array_indentation && M(x.mode), r = d, s = 0; s < e.comments_before.length; s++) C(d = e.comments_before[s], t), v[d.type](t);
                            if (d = r, i)
                                for (var a = 0; a < n; a += 1) L(a > 0, t);
                            else if (k.max_preserve_newlines && n > k.max_preserve_newlines && (n = k.max_preserve_newlines), k.preserve_newlines && e.newlines > 1) {
                                L(!1, t);
                                for (var _ = 1; _ < n; _ += 1) L(!0, t)
                            }
                        }
                        T = "TK_START_BLOCK", g = "", (n = new s(m, R)).raw = k.test_output_raw, b = [], P(h.BlockStatement), this.beautify = function() {
                            for (f = new a(e, k, m), y = f.tokenize(), p = 0, d = X(); d;) v[d.type](), g = x.last_text, T = d.type, x.last_text = d.text, p += 1, d = X();
                            return n.get_code(k.end_with_newline, k.eol)
                        };
                        var N = ["break", "continue", "return", "throw", "yield"];

                        function D(e) {
                            if (e = void 0 !== e && e, !n.just_added_newline()) {
                                var t = k.preserve_newlines && d.wanted_newline || e;
                                if (o(x.last_text, f.positionable_operators) || o(d.text, f.positionable_operators)) {
                                    var i = o(x.last_text, f.positionable_operators) && o(k.operator_position, c) || o(d.text, f.positionable_operators);
                                    t = t && i
                                }
                                if (t) L(!1, !0);
                                else if (k.wrap_line_length) {
                                    if ("TK_RESERVED" === T && o(x.last_text, N)) return;
                                    n.current_line.get_character_count() + d.text.length + (n.space_before_token ? 1 : 0) >= k.wrap_line_length && L(!1, !0)
                                }
                            }
                        }

                        function L(e, t) {
                            if (!t && ";" !== x.last_text && "," !== x.last_text && "=" !== x.last_text && "TK_OPERATOR" !== T)
                                for (var i = X(1); !(x.mode !== h.Statement || x.if_block && i && "TK_RESERVED" === i.type && "else" === i.text || x.do_block);) U();
                            n.add_new_line(e) && (x.multiline_frame = !0)
                        }

                        function j() {
                            n.just_added_newline() && (k.keep_array_indentation && M(x.mode) && d.wanted_newline ? (n.current_line.push(d.whitespace_before), n.space_before_token = !1) : n.set_indent(x.indentation_level) && (x.line_indent_level = x.indentation_level))
                        }

                        function I(e) {
                            if (n.raw) n.add_raw_token(d);
                            else {
                                if (k.comma_first && "TK_COMMA" === T && n.just_added_newline() && "," === n.previous_line.last()) {
                                    var t = n.previous_line.pop();
                                    n.previous_line.is_empty() && (n.previous_line.push(t), n.trim(!0), n.current_line.pop(), n.trim()), j(), n.add_token(","), n.space_before_token = !0
                                }
                                e = e || d.text, j(), n.add_token(e)
                            }
                        }

                        function B() {
                            x.indentation_level += 1
                        }

                        function P(e) {
                            x ? (b.push(x), E = x) : E = K(null, e), x = K(E, e)
                        }

                        function M(e) {
                            return e === h.ArrayLiteral
                        }

                        function V(e) {
                            return o(e, [h.Expression, h.ForInitializer, h.Conditional])
                        }

                        function U() {
                            b.length > 0 && (E = x, x = b.pop(), E.mode !== h.Statement || k.unindent_chained_methods || _(n, E))
                        }

                        function z() {
                            return x.parent.mode === h.ObjectLiteral && x.mode === h.Statement && (":" === x.last_text && 0 === x.ternary_depth || "TK_RESERVED" === T && o(x.last_text, ["get", "set"]))
                        }

                        function W() {
                            return !!("TK_RESERVED" === T && o(x.last_text, ["var", "let", "const"]) && "TK_WORD" === d.type || "TK_RESERVED" === T && "do" === x.last_text || "TK_RESERVED" === T && o(x.last_text, N) && !d.wanted_newline || "TK_RESERVED" === T && "else" === x.last_text && ("TK_RESERVED" !== d.type || "if" !== d.text || d.comments_before.length) || "TK_END_EXPR" === T && (E.mode === h.ForInitializer || E.mode === h.Conditional) || "TK_WORD" === T && x.mode === h.BlockStatement && !x.in_case && "--" !== d.text && "++" !== d.text && "function" !== g && "TK_WORD" !== d.type && "TK_RESERVED" !== d.type || x.mode === h.ObjectLiteral && (":" === x.last_text && 0 === x.ternary_depth || "TK_RESERVED" === T && o(x.last_text, ["get", "set"]))) && (P(h.Statement), k.unindent_chained_methods || B(), C(d, !0), z() || D("TK_RESERVED" === d.type && o(d.text, ["do", "for", "if", "while"])), !0)
                        }

                        function G(e) {
                            return o(e, ["case", "return", "do", "if", "throw", "else"])
                        }

                        function X(e) {
                            var t = p + (e || 0);
                            return t < 0 || t >= y.length ? null : y[t]
                        }

                        function F() {
                            if ("TK_RESERVED" === d.type && (o(d.text, ["set", "get"]) && x.mode !== h.ObjectLiteral ? d.type = "TK_WORD" : o(d.text, ["as", "from"]) && !x.import_block ? d.type = "TK_WORD" : x.mode === h.ObjectLiteral && ":" === X(1).text && (d.type = "TK_WORD")), W() ? "TK_RESERVED" === T && o(x.last_text, ["var", "let", "const"]) && "TK_WORD" === d.type && (x.declaration_statement = !0) : !d.wanted_newline || V(x.mode) || "TK_OPERATOR" === T && "--" !== x.last_text && "++" !== x.last_text || "TK_EQUALS" === T || !k.preserve_newlines && "TK_RESERVED" === T && o(x.last_text, ["var", "let", "const", "set", "get"]) ? C(d) : (C(d), L()), x.do_block && !x.do_while) {
                                if ("TK_RESERVED" === d.type && "while" === d.text) return n.space_before_token = !0, I(), n.space_before_token = !0, void(x.do_while = !0);
                                L(), x.do_block = !1
                            }
                            if (x.if_block)
                                if (x.else_block || "TK_RESERVED" !== d.type || "else" !== d.text) {
                                    for (; x.mode === h.Statement;) U();
                                    x.if_block = !1, x.else_block = !1
                                } else x.else_block = !0;
                            return "TK_RESERVED" === d.type && ("case" === d.text || "default" === d.text && x.in_case_statement) ? (L(), (x.case_body || k.jslint_happy) && (x.indentation_level > 0 && (!x.parent || x.indentation_level > x.parent.indentation_level) && (x.indentation_level -= 1), x.case_body = !1), I(), x.in_case = !0, void(x.in_case_statement = !0)) : ("TK_COMMA" !== T && "TK_START_EXPR" !== T && "TK_EQUALS" !== T && "TK_OPERATOR" !== T || z() || D(), "TK_RESERVED" === d.type && "function" === d.text ? ((o(x.last_text, ["}", ";"]) || n.just_added_newline() && !o(x.last_text, ["(", "[", "{", ":", "=", ","]) && "TK_OPERATOR" !== T) && (n.just_added_blankline() || d.comments_before.length || (L(), L(!0))), "TK_RESERVED" === T || "TK_WORD" === T ? "TK_RESERVED" === T && (o(x.last_text, ["get", "set", "new", "export", "async"]) || o(x.last_text, N)) ? n.space_before_token = !0 : "TK_RESERVED" === T && "default" === x.last_text && "export" === g ? n.space_before_token = !0 : L() : "TK_OPERATOR" === T || "=" === x.last_text ? n.space_before_token = !0 : (x.multiline_frame || !V(x.mode) && !M(x.mode)) && L(), I(), void(x.last_word = d.text)) : (w = "NONE", "TK_END_BLOCK" === T ? E.inline_frame ? w = "SPACE" : "TK_RESERVED" === d.type && o(d.text, ["else", "catch", "finally", "from"]) ? "expand" === k.brace_style || "end-expand" === k.brace_style || "none" === k.brace_style && d.wanted_newline ? w = "NEWLINE" : (w = "SPACE", n.space_before_token = !0) : w = "NEWLINE" : "TK_SEMICOLON" === T && x.mode === h.BlockStatement ? w = "NEWLINE" : "TK_SEMICOLON" === T && V(x.mode) ? w = "SPACE" : "TK_STRING" === T ? w = "NEWLINE" : "TK_RESERVED" === T || "TK_WORD" === T || "*" === x.last_text && (o(g, ["function", "yield"]) || x.mode === h.ObjectLiteral && o(g, ["{", ","])) ? w = "SPACE" : "TK_START_BLOCK" === T ? w = x.inline_frame ? "SPACE" : "NEWLINE" : "TK_END_EXPR" === T && (n.space_before_token = !0, w = "NEWLINE"), "TK_RESERVED" === d.type && o(d.text, f.line_starters) && ")" !== x.last_text && (w = x.inline_frame || "else" === x.last_text || "export" === x.last_text ? "SPACE" : "NEWLINE"), "TK_RESERVED" === d.type && o(d.text, ["else", "catch", "finally"]) ? ("TK_END_BLOCK" !== T || E.mode !== h.BlockStatement || "expand" === k.brace_style || "end-expand" === k.brace_style || "none" === k.brace_style && d.wanted_newline) && !x.inline_frame ? L() : (n.trim(!0), "}" !== n.current_line.last() && L(), n.space_before_token = !0) : "NEWLINE" === w ? "TK_RESERVED" === T && G(x.last_text) ? n.space_before_token = !0 : "TK_END_EXPR" !== T ? "TK_START_EXPR" === T && "TK_RESERVED" === d.type && o(d.text, ["var", "let", "const"]) || ":" === x.last_text || ("TK_RESERVED" === d.type && "if" === d.text && "else" === x.last_text ? n.space_before_token = !0 : L()) : "TK_RESERVED" === d.type && o(d.text, f.line_starters) && ")" !== x.last_text && L() : x.multiline_frame && M(x.mode) && "," === x.last_text && "}" === g ? L() : "SPACE" === w && (n.space_before_token = !0), I(), x.last_word = d.text, void("TK_RESERVED" === d.type && ("do" === d.text ? x.do_block = !0 : "if" === d.text ? x.if_block = !0 : "import" === d.text ? x.import_block = !0 : x.import_block && "TK_RESERVED" === d.type && "from" === d.text && (x.import_block = !1)))))
                        }
                    }
                }, function(e, t) {
                    e.exports.InputScanner = function(e) {
                        var t = e,
                            n = t.length,
                            i = 0;
                        this.back = function() {
                            i -= 1
                        }, this.hasNext = function() {
                            return i < n
                        }, this.next = function() {
                            var e = null;
                            return this.hasNext() && (e = t.charAt(i), i += 1), e
                        }, this.peek = function(e) {
                            var r = null;
                            return e = e || 0, (e += i) >= 0 && e < n && (r = t.charAt(e)), r
                        }, this.peekCharCode = function(e) {
                            var r = 0;
                            return e = e || 0, (e += i) >= 0 && e < n && (r = t.charCodeAt(e)), r
                        }, this.test = function(e, n) {
                            return n = n || 0, e.lastIndex = i + n, e.test(t)
                        }, this.testChar = function(e, t) {
                            var n = this.peek(t);
                            return null !== n && e.test(n)
                        }, this.match = function(e) {
                            e.lastIndex = i;
                            var n = e.exec(t);
                            return n && n.index === i ? i += n[0].length : n = null, n
                        }
                    }
                }, function(e, t) {
                    e.exports.mergeOpts = function(e, t) {
                        var n, i = {};
                        for (n in e) n !== t && (i[n] = e[n]);
                        if (t in e)
                            for (n in e[t]) i[n] = e[t][n];
                        return i
                    }
                }, function(e, t) {
                    e.exports.Output = function(e, t) {
                        t = t || "", this.indent_cache = [t], this.baseIndentLength = t.length, this.indent_length = e.length, this.raw = !1;
                        var n = [];
                        this.baseIndentString = t, this.indent_string = e, this.previous_line = null, this.current_line = null, this.space_before_token = !1, this.add_outputline = function() {
                            this.previous_line = this.current_line, this.current_line = new function(e) {
                                var t = 0,
                                    n = -1,
                                    i = [],
                                    r = !0;
                                this.set_indent = function(i) {
                                    t = e.baseIndentLength + i * e.indent_length, n = i
                                }, this.get_character_count = function() {
                                    return t
                                }, this.is_empty = function() {
                                    return r
                                }, this.last = function() {
                                    return this._empty ? null : i[i.length - 1]
                                }, this.push = function(e) {
                                    i.push(e), t += e.length, r = !1
                                }, this.pop = function() {
                                    var e = null;
                                    return r || (e = i.pop(), t -= e.length, r = 0 === i.length), e
                                }, this.remove_indent = function() {
                                    n > 0 && (n -= 1, t -= e.indent_length)
                                }, this.trim = function() {
                                    for (;
                                        " " === this.last();) i.pop(), t -= 1;
                                    r = 0 === i.length
                                }, this.toString = function() {
                                    var t = "";
                                    return this._empty || (n >= 0 && (t = e.indent_cache[n]), t += i.join("")), t
                                }
                            }(this), n.push(this.current_line)
                        }, this.add_outputline(), this.get_line_number = function() {
                            return n.length
                        }, this.add_new_line = function(e) {
                            return !(1 === this.get_line_number() && this.just_added_newline() || !e && this.just_added_newline() || (this.raw || this.add_outputline(), 0))
                        }, this.get_code = function(e, t) {
                            var i = n.join("\n").replace(/[\r\n\t ]+$/, "");
                            return e && (i += "\n"), "\n" !== t && (i = i.replace(/[\n]/g, t)), i
                        }, this.set_indent = function(e) {
                            if (n.length > 1) {
                                for (; e >= this.indent_cache.length;) this.indent_cache.push(this.indent_cache[this.indent_cache.length - 1] + this.indent_string);
                                return this.current_line.set_indent(e), !0
                            }
                            return this.current_line.set_indent(0), !1
                        }, this.add_raw_token = function(e) {
                            for (var t = 0; t < e.newlines; t++) this.add_outputline();
                            this.current_line.push(e.whitespace_before), this.current_line.push(e.text), this.space_before_token = !1
                        }, this.add_token = function(e) {
                            this.add_space_before_token(), this.current_line.push(e)
                        }, this.add_space_before_token = function() {
                            this.space_before_token && !this.just_added_newline() && this.current_line.push(" "), this.space_before_token = !1
                        }, this.remove_indent = function(e) {
                            for (var t = n.length; e < t;) n[e].remove_indent(), e++
                        }, this.trim = function(i) {
                            for (i = void 0 !== i && i, this.current_line.trim(e, t); i && n.length > 1 && this.current_line.is_empty();) n.pop(), this.current_line = n[n.length - 1], this.current_line.trim();
                            this.previous_line = n.length > 1 ? n[n.length - 2] : null
                        }, this.just_added_newline = function() {
                            return this.current_line.is_empty()
                        }, this.just_added_blankline = function() {
                            return !!this.just_added_newline() && (1 === n.length || n[n.length - 2].is_empty())
                        }
                    }
                }, function(e, t) {
                    e.exports.Token = function(e, t, n, i, r) {
                        this.type = e, this.text = t, this.comments_before = [], this.comments_after = [], this.newlines = n || 0, this.wanted_newline = n > 0, this.whitespace_before = i || "", this.parent = r || null, this.opened = null, this.directives = null
                    }
                }, function(e, t, n) {
                    var i = n(1).Beautifier;
                    e.exports = function(e, t) {
                        return new i(e, t).beautify()
                    }
                }, function(e, t, n) {
                    var i = n(2).InputScanner,
                        r = n(5).Token,
                        s = n(0);

                    function a(e, t) {
                        for (var n = 0; n < t.length; n += 1)
                            if (t[n] === e) return !0;
                        return !1
                    }
                    e.exports.Tokenizer = function(e, t) {
                        var n = "\n\r\t ".split(""),
                            _ = /[0-9]/,
                            o = /[01]/,
                            l = /[01234567]/,
                            u = /[0123456789abcdefABCDEF]/;
                        this.positionable_operators = "!= !== % & && * ** + - / : < << <= == === > >= >> >>> ? ^ | ||".split(" ");
                        var c = this.positionable_operators.concat("! %= &= *= **= ++ += , -- -= /= :: <<= = => >>= >>>= ^= |= ~ ...".split(" "));
                        this.line_starters = "continue,try,throw,return,var,let,const,if,switch,case,default,for,while,break,function,import,export".split(",");
                        var h, p, f, d, T, g = this.line_starters.concat(["do", "in", "of", "else", "get", "set", "new", "catch", "finally", "typeof", "yield", "async", "await", "from", "as"]),
                            m = /([\s\S]*?)((?:\*\/)|$)/g,
                            x = /([^\n\r\u2028\u2029]*)/g,
                            E = /\/\* beautify( \w+[:]\w+)+ \*\//g,
                            b = / (\w+)[:](\w+)/g,
                            w = /([\s\S]*?)((?:\/\*\sbeautify\signore:end\s\*\/)|$)/g,
                            v = /((<\?php|<\?=)[\s\S]*?\?>)|(<%[\s\S]*?%>)/g;

                        function k() {
                            var e, k = [];
                            h = 0, p = "";
                            var y, R = T.next();
                            if (null === R) return ["", "TK_EOF"];
                            for (y = d.length ? d[d.length - 1] : new r("TK_START_BLOCK", "{"); a(R, n);)
                                if (s.newline.test(R) ? "\n" === R && "\r" === T.peek(-2) || (h += 1, k = []) : k.push(R), null === (R = T.next())) return ["", "TK_EOF"];
                            if (k.length && (p = k.join("")), _.test(R) || "." === R && T.testChar(_)) {
                                var K = !0,
                                    O = !0,
                                    S = _;
                                for ("0" === R && T.testChar(/[XxOoBb]/) ? (K = !1, O = !1, S = T.testChar(/[Bb]/) ? o : T.testChar(/[Oo]/) ? l : u, R += T.next()) : "." === R ? K = !1 : (R = "", T.back()); T.testChar(S);) R += T.next(), K && "." === T.peek() && (R += T.next(), K = !1), O && T.testChar(/[Ee]/) && (R += T.next(), T.testChar(/[+-]/) && (R += T.next()), O = !1, K = !1);
                                return [R, "TK_WORD"]
                            }
                            if (s.isIdentifierStart(T.peekCharCode(-1))) {
                                if (T.hasNext())
                                    for (; s.isIdentifierChar(T.peekCharCode()) && (R += T.next(), T.hasNext()););
                                return "TK_DOT" === y.type || "TK_RESERVED" === y.type && a(y.text, ["set", "get"]) || !a(R, g) ? [R, "TK_WORD"] : "in" === R || "of" === R ? [R, "TK_OPERATOR"] : [R, "TK_RESERVED"]
                            }
                            if ("(" === R || "[" === R) return [R, "TK_START_EXPR"];
                            if (")" === R || "]" === R) return [R, "TK_END_EXPR"];
                            if ("{" === R) return [R, "TK_START_BLOCK"];
                            if ("}" === R) return [R, "TK_END_BLOCK"];
                            if (";" === R) return [R, "TK_SEMICOLON"];
                            if ("/" === R) {
                                var A = "";
                                if ("*" === T.peek()) {
                                    T.next();
                                    var C = function(e) {
                                        if (!e.match(E)) return null;
                                        var t = {};
                                        b.lastIndex = 0;
                                        for (var n = b.exec(e); n;) t[n[1]] = n[2], n = b.exec(e);
                                        return t
                                    }(A = "/*" + T.match(m)[0]);
                                    return C && "start" === C.ignore && (A += T.match(w)[0]), [A = A.replace(s.allLineBreaks, "\n"), "TK_BLOCK_COMMENT", C]
                                }
                                if ("/" === T.peek()) return T.next(), [A = "//" + T.match(x)[0], "TK_COMMENT"]
                            }
                            var N, D = /<()([-a-zA-Z:0-9_.]+|{[\s\S]+?}|!\[CDATA\[[\s\S]*?\]\])(\s+{[\s\S]+?}|\s+[-a-zA-Z:0-9_.]+|\s+[-a-zA-Z:0-9_.]+\s*=\s*('[^']*'|"[^"]*"|{[\s\S]+?}))*\s*(\/?)\s*>/g;
                            if ("`" === R || "'" === R || '"' === R || ("/" === R || t.e4x && "<" === R && T.test(D, -1)) && ("TK_RESERVED" === y.type && a(y.text, ["return", "case", "throw", "else", "do", "typeof", "yield"]) || "TK_END_EXPR" === y.type && ")" === y.text && y.parent && "TK_RESERVED" === y.parent.type && a(y.parent.text, ["if", "while", "for"]) || a(y.type, ["TK_COMMENT", "TK_START_EXPR", "TK_START_BLOCK", "TK_END_BLOCK", "TK_OPERATOR", "TK_EQUALS", "TK_EOF", "TK_SEMICOLON", "TK_COMMA"]))) {
                                var L = R,
                                    j = !1,
                                    I = !1;
                                if (e = R, "/" === L)
                                    for (var B = !1; T.hasNext() && (j || B || T.peek() !== L) && !T.testChar(s.newline);) e += T.peek(), j ? j = !1 : (j = "\\" === T.peek(), "[" === T.peek() ? B = !0 : "]" === T.peek() && (B = !1)), T.next();
                                else if (t.e4x && "<" === L) {
                                    var P = /[\s\S]*?<(\/?)([-a-zA-Z:0-9_.]+|{[\s\S]+?}|!\[CDATA\[[\s\S]*?\]\])(\s+{[\s\S]+?}|\s+[-a-zA-Z:0-9_.]+|\s+[-a-zA-Z:0-9_.]+\s*=\s*('[^']*'|"[^"]*"|{[\s\S]+?}))*\s*(\/?)\s*>/g;
                                    T.back();
                                    var M = "",
                                        V = T.match(D);
                                    if (V) {
                                        for (var U = V[2].replace(/^{\s+/, "{").replace(/\s+}$/, "}"), z = 0 === U.indexOf("{"), W = 0; V;) {
                                            var G = !!V[1],
                                                X = V[2];
                                            if (!(V[V.length - 1] || "![CDATA[" === X.slice(0, 8)) && (X === U || z && X.replace(/^{\s+/, "{").replace(/\s+}$/, "}")) && (G ? --W : ++W), M += V[0], W <= 0) break;
                                            V = T.match(P)
                                        }
                                        return V || (M += T.match(/[\s\S]*/g)[0]), [M = M.replace(s.allLineBreaks, "\n"), "TK_STRING"]
                                    }
                                } else {
                                    var F = function(t, n, i) {
                                        for (var r; T.hasNext() && (r = T.peek(), j || r !== t && (n || !s.newline.test(r)));)(j || n) && s.newline.test(r) ? ("\r" === r && "\n" === T.peek(1) && (T.next(), r = T.peek()), e += "\n") : e += r, j ? ("x" !== r && "u" !== r || (I = !0), j = !1) : j = "\\" === r, T.next(), i && -1 !== e.indexOf(i, e.length - i.length) && ("`" === t ? F("}", n, "`") : F("`", n, "${"), T.hasNext() && (e += T.next()))
                                    };
                                    "`" === L ? F("`", !0, "${") : F(L)
                                }
                                if (I && t.unescape_strings && (e = function(e) {
                                        for (var t = "", n = 0, r = new i(e), s = null; r.hasNext();)
                                            if ((s = r.match(/([\s]|[^\\]|\\\\)+/g)) && (t += s[0]), "\\" === r.peek()) {
                                                if (r.next(), "x" === r.peek()) s = r.match(/x([0-9A-Fa-f]{2})/g);
                                                else {
                                                    if ("u" !== r.peek()) {
                                                        t += "\\", r.hasNext() && (t += r.next());
                                                        continue
                                                    }
                                                    s = r.match(/u([0-9A-Fa-f]{4})/g)
                                                }
                                                if (!s) return e;
                                                if ((n = parseInt(s[1], 16)) > 126 && n <= 255 && 0 === s[0].indexOf("x")) return e;
                                                if (n >= 0 && n < 32) {
                                                    t += "\\" + s[0];
                                                    continue
                                                }
                                                t += 34 === n || 39 === n || 92 === n ? "\\" + String.fromCharCode(n) : String.fromCharCode(n)
                                            }
                                        return t
                                    }(e)), T.peek() === L && (e += L, T.next(), "/" === L))
                                    for (; T.hasNext() && s.isIdentifierStart(T.peekCharCode());) e += T.next();
                                return [e, "TK_STRING"]
                            }
                            if ("#" === R) {
                                if (0 === d.length && "!" === T.peek()) {
                                    for (e = R; T.hasNext() && "\n" !== R;) R = T.next(), e += R;
                                    return [(N = e, N.replace(/^\s+|\s+$/g, "") + "\n"), "TK_UNKNOWN"]
                                }
                                var $ = "#";
                                if (T.hasNext() && T.testChar(_)) {
                                    for (; $ += R = T.next(), T.hasNext() && "#" !== R && "=" !== R;);
                                    return "#" === R || ("[" === T.peek() && "]" === T.peek(1) ? ($ += "[]", T.next(), T.next()) : "{" === T.peek() && "}" === T.peek(1) && ($ += "{}", T.next(), T.next())), [$, "TK_WORD"]
                                }
                            }
                            if ("<" === R && ("?" === T.peek() || "%" === T.peek())) {
                                T.back();
                                var Q = T.match(v);
                                if (Q) return [R = (R = Q[0]).replace(s.allLineBreaks, "\n"), "TK_STRING"]
                            }
                            if ("<" === R && T.match(/\!--/g)) {
                                for (R = "\x3c!--"; T.hasNext() && !T.testChar(s.newline);) R += T.next();
                                return f = !0, [R, "TK_COMMENT"]
                            }
                            if ("-" === R && f && T.match(/->/g)) return f = !1, ["--\x3e", "TK_COMMENT"];
                            if ("." === R) return "." === T.peek() && "." === T.peek(1) ? [R += T.next() + T.next(), "TK_OPERATOR"] : [R, "TK_DOT"];
                            if (a(R, c)) {
                                for (; T.hasNext() && a(R + T.peek(), c) && (R += T.next(), T.hasNext()););
                                return "," === R ? [R, "TK_COMMA"] : "=" === R ? [R, "TK_EQUALS"] : [R, "TK_OPERATOR"]
                            }
                            return [R, "TK_UNKNOWN"]
                        }
                        this.tokenize = function() {
                            var t, n, s;
                            T = new i(e), f = !1, d = [];
                            for (var a = null, _ = [], o = []; !n || "TK_EOF" !== n.type;) {
                                for (s = k(), t = new r(s[1], s[0], h, p);
                                    "TK_COMMENT" === t.type || "TK_BLOCK_COMMENT" === t.type || "TK_UNKNOWN" === t.type;) "TK_BLOCK_COMMENT" === t.type && (t.directives = s[2]), o.push(t), s = k(), t = new r(s[1], s[0], h, p);
                                o.length && (t.comments_before = o, o = []), "TK_START_BLOCK" === t.type || "TK_START_EXPR" === t.type ? (t.parent = n, _.push(a), a = t) : ("TK_END_BLOCK" === t.type || "TK_END_EXPR" === t.type) && a && ("]" === t.text && "[" === a.text || ")" === t.text && "(" === a.text || "}" === t.text && "{" === a.text) && (t.parent = a.parent, t.opened = a, a = _.pop()), d.push(t), n = t
                            }
                            return d
                        }
                    }
                }]), void 0 !== n ? n.js_beautify = t : "undefined" != typeof window ? window.js_beautify = t : void 0 !== e && (e.js_beautify = t)
            }).call(this, "undefined" != typeof global ? global : "undefined" != typeof self ? self : "undefined" != typeof window ? window : {})
        }, {}]
    }, {}, [1])(1)
});