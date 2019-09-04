/* https://github.com/yaml/yaml.js-standalone */
var Yaml = function() {};
Yaml.prototype = {
    spec: "1.2",
    setSpecVersion: function(a) {
        if (a != "1.1" && a != "1.2") {
            throw new InvalidArgumentException("Version " + a + " of the YAML specifications is not supported")
        }
        this.spec = a
    },
    getSpecVersion: function() {
        return this.spec
    },
    loadFile: function(a, b) {
        if (b == undefined) {
            input = this.getFileContents(a);
            return this.load(input)
        }
        this.getFileContents(a, function(c) {
            b(new Yaml().load(c))
        })
    },
    load: function(a) {
        var c = new YamlParser();
        var b = null;
        try {
            b = c.parse(a)
        } catch (d) {
            if (d.name != undefined && d.name.toString == "TypeError") {
                throw d
            }
            throw "Syntax error: " + d.message
        }
        return b
    },
    dump: function(b, a) {
        if (a == undefined) {
            a = 2
        }
        yaml = new YamlDumper();
        return yaml.dump(b, a)
    },
    getXHR: function() {
        if (window.XMLHttpRequest) {
            return new XMLHttpRequest()
        }
        if (window.ActiveXObject) {
            var c = ["Msxml2.XMLHTTP.6.0", "Msxml2.XMLHTTP.3.0", "Msxml2.XMLHTTP", "Microsoft.XMLHTTP"];
            for (var a = 0; a < 4; a++) {
                try {
                    return new ActiveXObject(c[a])
                } catch (b) {}
            }
        }
        return null
    },
    getFileContents: function(a, c) {
        var b = this.getXHR();
        if (c == undefined) {
            b.open("GET", a, false);
            b.send(null);
            if (b.status == 200 || b.status == 0) {
                return b.responseText
            }
            return null
        }
        b.onreadystatechange = function() {
            if (b.readyState == 4) {
                if (b.status == 200 || b.status == 0) {
                    c(b.responseText)
                } else {
                    c(null)
                }
            }
        };
        b.open("GET", a, true);
        b.send(null)
    }
};
var YAML = {
    encode: function(a) {
        return new Yaml().dump(a)
    },
    decode: function(a) {
        return new Yaml().load(a)
    },
    load: function(a, b) {
        return new Yaml().loadFile(a, b)
    }
};
if (typeof(InvalidArgumentException) == "undefined") {
    InvalidArgumentException = function(a) {
        this.name = "InvalidArgumentException";
        this.message = a
    }
};
var YamlInline = function() {};
YamlInline.prototype = {
    i: null,
    load: function(b) {
        var a = null;
        b = this.trim(b);
        if (0 == b.length) {
            return ""
        }
        switch (b.charAt(0)) {
            case "[":
                a = this.parseSequence(b);
                break;
            case "{":
                a = this.parseMapping(b);
                break;
            default:
                a = this.parseScalar(b)
        }
        return a
    },
    dump: function(d) {
        var b;
        var a;
        var c = new Yaml();
        if ("1.1" == c.getSpecVersion()) {
            b = ["true", "on", "+", "yes", "y"];
            a = ["false", "off", "-", "no", "n"]
        } else {
            b = ["true"];
            a = ["false"]
        }
        if (typeof(d) == "object" && null != d) {
            return this.dumpObject(d)
        }
        if (undefined == d || null == d) {
            return "null"
        }
        if (typeof(d) == "boolean") {
            return d ? "true" : "false"
        }
        if (/^\d+/.test(d)) {
            return typeof(d) == "string" ? "'" + d + "'" : parseInt(d)
        }
        if (this.isNumeric(d)) {
            return typeof(d) == "string" ? "'" + d + "'" : parseFloat(d)
        }
        if (typeof(d) == "number") {
            return d == Infinity ? ".Inf" : (d == -Infinity ? "-.Inf" : (isNaN(d) ? ".NAN" : d))
        }
        if ((d + "").indexOf("\n") != -1 || (d + "").indexOf("\r") != -1) {
            return '"' + d.split('"').join('\\"').split("\n").join("\\n").split("\r").join("\\r") + '"'
        }
        if ((/[\s\'"\:\{\}\[\],&\*\#\?]/.test(d)) || (/^[-?|<>=!%@`]/.test(d))) {
            return "'" + d.split("'").join("''") + "'"
        }
        if ("" == d) {
            return "''"
        }
        if (this.getTimestampRegex().test(d)) {
            return "'" + d + "'"
        }
        if (this.inArray(d.toLowerCase(), b)) {
            return "'" + d + "'"
        }
        if (this.inArray(d.toLowerCase(), a)) {
            return "'" + d + "'"
        }
        if (this.inArray(d.toLowerCase(), ["null", "~"])) {
            return "'" + d + "'"
        }
        return d
    },
    dumpObject: function(e) {
        var d = this.getKeys(e);
        var b = null;
        var c;
        var a = d.length;
        if (e instanceof Array) {
            b = [];
            for (c = 0; c < a; c++) {
                b.push(this.dump(e[d[c]]))
            }
            return "[" + b.join(", ") + "]"
        }
        b = [];
        for (c = 0; c < a; c++) {
            b.push(this.dump(d[c]) + ": " + this.dump(e[d[c]]))
        }
        return "{ " + b.join(", ") + " }"
    },
    parseScalar: function(b, g, e, d, f) {
        if (g == undefined) {
            g = null
        }
        if (e == undefined) {
            e = ['"', "'"]
        }
        if (d == undefined) {
            d = 0
        }
        if (f == undefined) {
            f = true
        }
        var a = null;
        var h = null;
        var c = null;
        if (this.inArray(b[d], e)) {
            a = this.parseQuotedScalar(b, d);
            d = this.i
        } else {
            if (!g) {
                a = (b + "").substring(d);
                d += a.length;
                h = a.indexOf(" #");
                if (h != -1) {
                    a = a.substr(0, h).replace(/\s+$/g, "")
                }
            } else {
                if (c = new RegExp("^(.+?)(" + g.join("|") + ")").exec((b + "").substring(d))) {
                    a = c[1];
                    d += a.length
                } else {
                    throw new InvalidArgumentException("Malformed inline YAML string (" + b + ").")
                }
            }
            a = f ? this.evaluateScalar(a) : a
        }
        this.i = d;
        return a
    },
    parseQuotedScalar: function(b, d) {
        var c = null;
        if (!(c = new RegExp("^" + YamlInline.REGEX_QUOTED_STRING).exec((b + "").substring(d)))) {
            throw new InvalidArgumentException("Malformed inline YAML string (" + (b + "").substring(d) + ").")
        }
        var a = c[0].substr(1, c[0].length - 2);
        if ('"' == (b + "").charAt(d)) {
            a = a.split('\\"').join('"').split("\\n").join("\n").split("\\r").join("\r")
        } else {
            a = a.split("''").join("'")
        }
        d += c[0].length;
        this.i = d;
        return a
    },
    parseSequence: function(g, c) {
        if (c == undefined) {
            c = 0
        }
        var b = [];
        var a = g.length;
        c += 1;
        while (c < a) {
            switch (g.charAt(c)) {
                case "[":
                    b.push(this.parseSequence(g, c));
                    c = this.i;
                    break;
                case "{":
                    b.push(this.parseMapping(g, c));
                    c = this.i;
                    break;
                case "]":
                    this.i = c;
                    return b;
                case ",":
                case " ":
                    break;
                default:
                    isQuoted = this.inArray(g.charAt(c), ['"', "'"]);
                    var d = this.parseScalar(g, [",", "]"], ['"', "'"], c);
                    c = this.i;
                    if (!isQuoted && (d + "").indexOf(": ") != -1) {
                        try {
                            d = this.parseMapping("{" + d + "}")
                        } catch (f) {
                            if (!(f instanceof InvalidArgumentException)) {
                                throw f
                            }
                        }
                    }
                    b.push(d);
                    c--
            }
            c++
        }
        throw new InvalidArgumentException("Malformed inline YAML string " + g)
    },
    parseMapping: function(d, f) {
        if (f == undefined) {
            f = 0
        }
        var c = {};
        var a = d.length;
        f += 1;
        var b = false;
        var g = false;
        while (f < a) {
            g = false;
            switch (d.charAt(f)) {
                case " ":
                case ",":
                    f++;
                    g = true;
                    break;
                case "}":
                    this.i = f;
                    return c
            }
            if (g) {
                continue
            }
            var e = this.parseScalar(d, [":", " "], ['"', "'"], f, false);
            f = this.i;
            b = false;
            while (f < a) {
                switch (d.charAt(f)) {
                    case "[":
                        c[e] = this.parseSequence(d, f);
                        f = this.i;
                        b = true;
                        break;
                    case "{":
                        c[e] = this.parseMapping(d, f);
                        f = this.i;
                        b = true;
                        break;
                    case ":":
                    case " ":
                        break;
                    default:
                        c[e] = this.parseScalar(d, [",", "}"], ['"', "'"], f);
                        f = this.i;
                        b = true;
                        f--
                }++f;
                if (b) {
                    g = true;
                    break
                }
            }
            if (g) {
                continue
            }
        }
        throw new InvalidArgumentException("Malformed inline YAML string " + d)
    },
    evaluateScalar: function(b) {
        b = this.trim(b);
        var e;
        var d;
        var f = new Yaml();
        if ("1.1" == f.getSpecVersion()) {
            e = ["true", "on", "+", "yes", "y"];
            d = ["false", "off", "-", "no", "n"]
        } else {
            e = ["true"];
            d = ["false"]
        }
        var c = null;
        var a = null;
        if (("null" == b.toLowerCase()) || ("" == b) || ("~" == b)) {
            return null
        }
        if ((b + "").indexOf("!str") != -1) {
            return ("" + b).substring(5)
        }
        if ((b + "").indexOf("! ") != -1) {
            return parseInt(this.parseScalar((b + "").substring(2)))
        }
        if (/^\d+/.test(b)) {
            c = b;
            a = parseInt(b);
            return "0" == b.charAt(0) ? this.octdec(b) : (("" + c == "" + a) ? a : c)
        }
        if (this.inArray(b.toLowerCase(), e)) {
            return true
        }
        if (this.inArray(b.toLowerCase(), d)) {
            return false
        }
        if (this.isNumeric(b)) {
            return "0x" == (b + "").substr(0, 2) ? hexdec($scalar) : floatval($scalar)
        }
        if (b.toLowerCase() == ".inf") {
            return Infinity
        }
        if (b.toLowerCase() == ".nan") {
            return NaN
        }
        if (b.toLowerCase() == "-.inf") {
            return -Infinity
        }
        if (/^(-|\+)?[0-9,]+(\.[0-9]+)?$/.test(b)) {
            return parseFloat(b.split(",").join(""))
        }
        if (this.getTimestampRegex().test(b)) {
            return this.strtodate(b)
        }
        return "" + b
    },
    getTimestampRegex: function() {
        return new RegExp("^([0-9][0-9][0-9][0-9])-([0-9][0-9]?)-([0-9][0-9]?)(?:(?:[Tt]|[ \t]+)([0-9][0-9]?):([0-9][0-9]):([0-9][0-9])(?:.([0-9]*))?(?:[ \t]*(Z|([-+])([0-9][0-9]?)(?::([0-9][0-9]))?))?)?$", "gi")
    },
    trim: function(a) {
        return (a + "").replace(/^\s+/, "").replace(/\s+$/, "")
    },
    isNumeric: function(a) {
        return (a - 0) == a && a.length > 0 && a.replace(/\s+/g, "") != ""
    },
    inArray: function(c, d) {
        var b;
        var a = d.length;
        for (b = 0; b < a; b++) {
            if (c == d[b]) {
                return true
            }
        }
        return false
    },
    getKeys: function(c) {
        var b = [];
        for (var a in c) {
            if (c.hasOwnProperty(a)) {
                b.push(a)
            }
        }
        return b
    },
    octdec: function(a) {
        return parseInt((a + "").replace(/[^0-7]/gi, ""), 8)
    },
    hexdec: function(a) {
        a = this.trim(a);
        if ((a + "").substr(0, 2) == "0x") {
            a = (a + "").substring(2)
        }
        return parseInt((a + "").replace(/[^a-f0-9]/gi, ""), 16)
    },
    strtodate: function(a) {
        var b = new Date();
        b.setTime(this.strtotime(a, new Date().getTime()));
        return b
    },
    strtotime: function(o, t) {
        var q, p, i, m = "",
            s = "";
        m = o;
        m = m.replace(/\s{2,}|^\s|\s$/g, " ");
        m = m.replace(/[\t\r\n]/g, "");
        if (m == "now") {
            return (new Date()).getTime() / 1000
        } else {
            if (!isNaN(s = Date.parse(m))) {
                return (s / 1000)
            } else {
                if (t) {
                    t = new Date(t * 1000)
                } else {
                    t = new Date()
                }
            }
        }
        m = m.toLowerCase();
        var r = {
            day: {
                sun: 0,
                mon: 1,
                tue: 2,
                wed: 3,
                thu: 4,
                fri: 5,
                sat: 6
            },
            mon: {
                jan: 0,
                feb: 1,
                mar: 2,
                apr: 3,
                may: 4,
                jun: 5,
                jul: 6,
                aug: 7,
                sep: 8,
                oct: 9,
                nov: 10,
                dec: 11
            }
        };
        var v = this.strtotime;
        var u = function(a) {
            var c = (a[2] && a[2] == "ago");
            var d = (d = a[0] == "last" ? -1 : 1) * (c ? -1 : 1);
            switch (a[0]) {
                case "last":
                case "next":
                    switch (a[1].substring(0, 3)) {
                        case "yea":
                            t.setFullYear(t.getFullYear() + d);
                            break;
                        case "mon":
                            t.setMonth(t.getMonth() + d);
                            break;
                        case "wee":
                            t.setDate(t.getDate() + (d * 7));
                            break;
                        case "day":
                            t.setDate(t.getDate() + d);
                            break;
                        case "hou":
                            t.setHours(t.getHours() + d);
                            break;
                        case "min":
                            t.setMinutes(t.getMinutes() + d);
                            break;
                        case "sec":
                            t.setSeconds(t.getSeconds() + d);
                            break;
                        default:
                            var e;
                            if (typeof(e = r.day[a[1].substring(0, 3)]) != "undefined") {
                                var b = e - t.getDay();
                                if (b == 0) {
                                    b = 7 * d
                                } else {
                                    if (b > 0) {
                                        if (a[0] == "last") {
                                            b -= 7
                                        }
                                    } else {
                                        if (a[0] == "next") {
                                            b += 7
                                        }
                                    }
                                }
                                t.setDate(t.getDate() + b)
                            }
                    }
                    break;
                default:
                    if (/\d+/.test(a[0])) {
                        d *= parseInt(a[0], 10);
                        switch (a[1].substring(0, 3)) {
                            case "yea":
                                t.setFullYear(t.getFullYear() + d);
                                break;
                            case "mon":
                                t.setMonth(t.getMonth() + d);
                                break;
                            case "wee":
                                t.setDate(t.getDate() + (d * 7));
                                break;
                            case "day":
                                t.setDate(t.getDate() + d);
                                break;
                            case "hou":
                                t.setHours(t.getHours() + d);
                                break;
                            case "min":
                                t.setMinutes(t.getMinutes() + d);
                                break;
                            case "sec":
                                t.setSeconds(t.getSeconds() + d);
                                break
                        }
                    } else {
                        return false
                    }
                    break
            }
            return true
        };
        p = m.match(/^(\d{2,4}-\d{2}-\d{2})(?:\s(\d{1,2}:\d{2}(:\d{2})?)?(?:\.(\d+))?)?$/);
        if (p != null) {
            if (!p[2]) {
                p[2] = "00:00:00"
            } else {
                if (!p[3]) {
                    p[2] += ":00"
                }
            }
            i = p[1].split(/-/g);
            for (q in r.mon) {
                if (r.mon[q] == i[1] - 1) {
                    i[1] = q
                }
            }
            i[0] = parseInt(i[0], 10);
            i[0] = (i[0] >= 0 && i[0] <= 69) ? "20" + (i[0] < 10 ? "0" + i[0] : i[0] + "") : (i[0] >= 70 && i[0] <= 99) ? "19" + i[0] : i[0] + "";
            return parseInt(v(i[2] + " " + i[1] + " " + i[0] + " " + p[2]) + (p[4] ? p[4] / 1000 : ""), 10)
        }
        var n = "([+-]?\\d+\\s(years?|months?|weeks?|days?|hours?|min|minutes?|sec|seconds?|sun\\.?|sunday|mon\\.?|monday|tue\\.?|tuesday|wed\\.?|wednesday|thu\\.?|thursday|fri\\.?|friday|sat\\.?|saturday)|(last|next)\\s(years?|months?|weeks?|days?|hours?|min|minutes?|sec|seconds?|sun\\.?|sunday|mon\\.?|monday|tue\\.?|tuesday|wed\\.?|wednesday|thu\\.?|thursday|fri\\.?|friday|sat\\.?|saturday))(\\sago)?";
        p = m.match(new RegExp(n, "gi"));
        if (p == null) {
            return false
        }
        for (q = 0; q < p.length; q++) {
            if (!u(p[q].split(" "))) {
                return false
            }
        }
        return (t.getTime() / 1000)
    }
};
YamlInline.REGEX_QUOTED_STRING = "(?:\"(?:[^\"\\\\]*(?:\\\\.[^\"\\\\]*)*)\"|'(?:[^']*(?:''[^']*)*)')";
var YamlParser = function(a) {
    this.offset = this.isDefined(a) ? a : 0
};
YamlParser.prototype = {
    offset: 0,
    lines: [],
    currentLineNb: -1,
    currentLine: "",
    refs: {},
    parse: function(m) {
        this.currentLineNb = -1;
        this.currentLine = "";
        this.lines = this.cleanup(m).split("\n");
        var u = null;
        while (this.moveToNextLine()) {
            if (this.isCurrentLineEmpty()) {
                continue
            }
            if (/^\t+/.test(this.currentLine)) {
                throw new InvalidArgumentException("A YAML file cannot contain tabs as indentation at line " + (this.getRealCurrentLineNb() + 1) + " (" + this.currentLine + ")")
            }
            var j = false;
            var r = false;
            var q = false;
            var b = null;
            var a = null;
            var t = null;
            var d = null;
            var e = null;
            var v = null;
            var h = null;
            var p = null;
            var f = null;
            if (b = /^\-((\s+)(.+?))?\s*$/.exec(this.currentLine)) {
                if (!this.isDefined(u)) {
                    u = []
                }
                if (!(u instanceof Array)) {
                    throw new InvalidArgumentException("Non array entry at line " + (this.getRealCurrentLineNb() + 1) + ".")
                }
                b = {
                    leadspaces: b[2],
                    value: b[3]
                };
                if (this.isDefined(b.value) && (a = /^&([^ ]+) *(.*)/.exec(b.value))) {
                    a = {
                        ref: a[1],
                        value: a[2]
                    };
                    j = a.ref;
                    b.value = a.value
                }
                if (!this.isDefined(b.value) || "" == b.value.split(" ").join("") || this.trim(b.value).charAt(0) == "#") {
                    t = this.getRealCurrentLineNb() + 1;
                    d = new YamlParser(t);
                    d.refs = this.refs;
                    u.push(d.parse(this.getNextEmbedBlock()));
                    this.refs = d.refs
                } else {
                    if (this.isDefined(b.leadspaces) && " " == b.leadspaces && (a = new RegExp("^(" + YamlInline.REGEX_QUOTED_STRING + "|[^ '\"{].*?) *:(\\s+(.+?))?\\s*$").exec(b.value))) {
                        a = {
                            key: a[1],
                            value: a[3]
                        };
                        t = this.getRealCurrentLineNb();
                        d = new YamlParser(t);
                        d.refs = this.refs;
                        e = b.value;
                        if (!this.isNextLineIndented()) {
                            e += "\n" + this.getNextEmbedBlock(this.getCurrentLineIndentation() + 2)
                        }
                        u.push(d.parse(e));
                        this.refs = d.refs
                    } else {
                        u.push(this.parseValue(b.value))
                    }
                }
            } else {
                if (b = new RegExp("^(" + YamlInline.REGEX_QUOTED_STRING + "|[^ '\"].*?) *:(\\s+(.+?))?\\s*$").exec(this.currentLine)) {
                    if (!this.isDefined(u)) {
                        u = {}
                    }
                    if (u instanceof Array) {
                        throw new InvalidArgumentException("Non mapped entry at line " + (this.getRealCurrentLineNb() + 1) + ".")
                    }
                    b = {
                        key: b[1],
                        value: b[3]
                    };
                    v = (new YamlInline()).parseScalar(b.key);
                    if ("<<" == v) {
                        if (this.isDefined(b.value) && "*" == (b.value + "").charAt(0)) {
                            r = b.value.substring(1)
                        } else {
                            if (this.isDefined(b.value) && b.value != "") {
                                m = b.value
                            } else {
                                m = this.getNextEmbedBlock()
                            }
                            t = this.getRealCurrentLineNb() + 1;
                            d = new YamlParser(t);
                            d.refs = this.refs;
                            h = d.parse(m);
                            this.refs = d.refs;
                            var s = [];
                            if (!this.isObject(h)) {
                                throw new InvalidArgumentException("YAML merge keys used with a scalar value instead of an array at line " + (this.getRealCurrentLineNb() + 1) + " (" + this.currentLine + ")")
                            } else {
                                if (this.isDefined(h[0])) {
                                    f = this.reverseArray(h);
                                    p = f.length;
                                    for (var o = 0; o < p; o++) {
                                        var l = f[o];
                                        if (!this.isObject(f[o])) {
                                            throw new InvalidArgumentException("Merge items must be arrays at line " + (this.getRealCurrentLineNb() + 1) + " (" + f[o] + ").")
                                        }
                                        s = this.mergeObject(f[o], s)
                                    }
                                } else {
                                    s = this.mergeObject(s, h)
                                }
                            }
                            q = s
                        }
                    } else {
                        if (this.isDefined(b.value) && (a = /^&([^ ]+) *(.*)/.exec(b.value))) {
                            a = {
                                ref: a[1],
                                value: a[2]
                            };
                            j = a.ref;
                            b.value = a.value
                        }
                    }
                    if (q) {
                        u = q
                    } else {
                        if (!this.isDefined(b.value) || "" == b.value.split(" ").join("") || this.trim(b.value).charAt(0) == "#") {
                            if (this.isNextLineIndented()) {
                                u[v] = null
                            } else {
                                t = this.getRealCurrentLineNb() + 1;
                                d = new YamlParser(t);
                                d.refs = this.refs;
                                u[v] = d.parse(this.getNextEmbedBlock());
                                this.refs = d.refs
                            }
                        } else {
                            if (r) {
                                u = this.refs[r]
                            } else {
                                u[v] = this.parseValue(b.value)
                            }
                        }
                    }
                } else {
                    if (2 == this.lines.length && this.isEmpty(this.lines[1])) {
                        m = (new YamlInline()).load(this.lines[0]);
                        if (this.isObject(m)) {
                            first = m[0];
                            if ("*" == (first + "").substr(0, 1)) {
                                u = [];
                                p = m.length;
                                for (var o = 0; o < p; o++) {
                                    u.push(this.refs[m[o].substring(1)])
                                }
                                m = u
                            }
                        }
                        return m
                    }
                    throw new InvalidArgumentException('"' + this.currentLine + '" at line ' + (this.getRealCurrentLineNb() + 1))
                }
            }
            if (j) {
                if (u instanceof Array) {
                    this.refs[j] = u[u.length - 1]
                } else {
                    var g = null;
                    for (var n in u) {
                        if (u.hasOwnProperty(n)) {
                            g = n
                        }
                    }
                    this.refs[j] = u[n]
                }
            }
        }
        return this.isEmpty(u) ? null : u
    },
    getRealCurrentLineNb: function() {
        return this.currentLineNb + this.offset
    },
    getCurrentLineIndentation: function() {
        return this.currentLine.length - this.currentLine.replace(/^ +/g, "").length
    },
    getNextEmbedBlock: function(d) {
        this.moveToNextLine();
        var b = null;
        var a = null;
        if (!this.isDefined(d)) {
            b = this.getCurrentLineIndentation();
            if (!this.isCurrentLineEmpty() && 0 == b) {
                throw new InvalidArgumentException("A Indentation problem at line " + (this.getRealCurrentLineNb() + 1) + " (" + this.currentLine + ")")
            }
        } else {
            b = d
        }
        var e = [this.currentLine.substring(b)];
        while (this.moveToNextLine()) {
            if (this.isCurrentLineEmpty()) {
                if (this.isCurrentLineBlank()) {
                    e.push(this.currentLine.substring(b))
                }
                continue
            }
            a = this.getCurrentLineIndentation();
            var c;
            if (c = /^( *)$/.exec(this.currentLine)) {
                e.push(c[1])
            } else {
                if (a >= b) {
                    e.push(this.currentLine.substring(b))
                } else {
                    if (0 == a) {
                        this.moveToPreviousLine();
                        break
                    } else {
                        throw new InvalidArgumentException("B Indentation problem at line " + (this.getRealCurrentLineNb() + 1) + " (" + this.currentLine + ")")
                    }
                }
            }
        }
        return e.join("\n")
    },
    moveToNextLine: function() {
        if (this.currentLineNb >= this.lines.length - 1) {
            return false
        }
        this.currentLineNb++;
        this.currentLine = this.lines[this.currentLineNb];
        return true
    },
    moveToPreviousLine: function() {
        this.currentLineNb--;
        this.currentLine = this.lines[this.currentLineNb]
    },
    parseValue: function(c) {
        if ("*" == (c + "").charAt(0)) {
            if (this.trim(c).charAt(0) == "#") {
                c = (c + "").substr(1, c.indexOf("#") - 2)
            } else {
                c = (c + "").substring(1)
            }
            if (this.refs[c] == undefined) {
                throw new InvalidArgumentException('Reference "' + c + '" does not exist (' + this.currentLine + ").")
            }
            return this.refs[c]
        }
        var b = null;
        if (b = /^(\||>)(\+|\-|\d+|\+\d+|\-\d+|\d+\+|\d+\-)?( +#.*)?$/.exec(c)) {
            b = {
                separator: b[1],
                modifiers: b[2],
                comments: b[3]
            };
            var a = this.isDefined(b.modifiers) ? b.modifiers : "";
            return this.parseFoldedScalar(b.separator, a.replace(/\d+/g, ""), Math.abs(parseInt(a)))
        } else {
            return (new YamlInline()).load(c)
        }
    },
    parseFoldedScalar: function(c, h, f) {
        if (h == undefined) {
            h = ""
        }
        if (f == undefined) {
            f = 0
        }
        c = "|" == c ? "\n" : " ";
        var j = "";
        var g = null;
        var b = this.moveToNextLine();
        while (b && this.isCurrentLineBlank()) {
            j += "\n";
            b = this.moveToNextLine()
        }
        if (!b) {
            return ""
        }
        var d = null;
        if (!(d = new RegExp("^(" + (f ? this.strRepeat(" ", f) : " +") + ")(.*)$").exec(this.currentLine))) {
            this.moveToPreviousLine();
            return ""
        }
        d = {
            indent: d[1],
            text: d[2]
        };
        var a = d.indent;
        var e = 0;
        j += d.text + c;
        while (this.currentLineNb + 1 < this.lines.length) {
            this.moveToNextLine();
            if (d = new RegExp("^( {" + a.length + ",})(.+)$").exec(this.currentLine)) {
                d = {
                    indent: d[1],
                    text: d[2]
                };
                if (" " == c && e != d.indent) {
                    j = j.substr(0, j.length - 1) + "\n"
                }
                e = d.indent;
                g = d.indent.length - a.length;
                j += this.strRepeat(" ", g) + d.text + (g != 0 ? "\n" : c)
            } else {
                if (d = /^( *)$/.exec(this.currentLine)) {
                    j += d[1].replace(new RegExp("^ {1," + a.length + "}", "g"), "", d[1]) + "\n"
                } else {
                    this.moveToPreviousLine();
                    break
                }
            }
        }
        if (" " == c) {
            j = j.replace(/ (\n*)$/g, "\n$1")
        }
        switch (h) {
            case "":
                j = j.replace(/\n+$/g, "\n");
                break;
            case "+":
                break;
            case "-":
                j = j.replace(/\n+$/g, "");
                break
        }
        return j
    },
    isNextLineIndented: function() {
        var b = this.getCurrentLineIndentation();
        var c = this.moveToNextLine();
        while (c && this.isCurrentLineEmpty()) {
            c = this.moveToNextLine()
        }
        if (false == c) {
            return false
        }
        var a = false;
        if (this.getCurrentLineIndentation() <= b) {
            a = true
        }
        this.moveToPreviousLine();
        return a
    },
    isCurrentLineEmpty: function() {
        return this.isCurrentLineBlank() || this.isCurrentLineComment()
    },
    isCurrentLineBlank: function() {
        return "" == this.currentLine.split(" ").join("")
    },
    isCurrentLineComment: function() {
        var a = this.currentLine.replace(/^ +/g, "");
        return a.charAt(0) == "#"
    },
    cleanup: function(c) {
        c = c.split("\r\n").join("\n").split("\r").join("\n");
        if (!/\n$/.test(c)) {
            c += "\n"
        }
        var b = 0;
        var a = /^\%YAML[: ][\d\.]+.*\n/;
        while (a.test(c)) {
            c = c.replace(a, "");
            b++
        }
        this.offset += b;
        a = /^(#.*?\n)+/;
        if (a.test(c)) {
            trimmedValue = c.replace(a, "");
            this.offset += this.subStrCount(c, "\n") - this.subStrCount(trimmedValue, "\n");
            c = trimmedValue
        }
        a = /^\-\-\-.*?\n/;
        if (a.test(c)) {
            trimmedValue = c.replace(a, "");
            this.offset += this.subStrCount(c, "\n") - this.subStrCount(trimmedValue, "\n");
            c = trimmedValue;
            c = c.replace(/\.\.\.\s*$/g, "")
        }
        return c
    },
    isObject: function(a) {
        return typeof(a) == "object" && this.isDefined(a)
    },
    isEmpty: function(a) {
        return a == undefined || a == null || a == "" || a == 0 || a == "0" || a == false
    },
    isDefined: function(a) {
        return a != undefined && a != null
    },
    reverseArray: function(c) {
        var b = [];
        var a = c.length;
        for (var d = a - 1; d >= 0; d--) {
            b.push(c[d])
        }
        return b
    },
    merge: function(e, d) {
        var f = {};
        for (i in e) {
            if (/^\d+$/.test(i)) {
                f.push(e)
            } else {
                f[i] = e[i]
            }
        }
        for (i in d) {
            if (/^\d+$/.test(i)) {
                f.push(d)
            } else {
                f[i] = d[i]
            }
        }
        return f
    },
    strRepeat: function(d, c) {
        var b;
        var a = "";
        for (b = 0; b < c; b++) {
            a += d
        }
        return d
    },
    subStrCount: function(d, b, j, f) {
        var h = 0;
        d = "" + d;
        b = "" + b;
        if (j != undefined) {
            d = d.substr(j)
        }
        if (f != undefined) {
            d = d.substr(0, f)
        }
        var a = d.length;
        var g = b.length;
        for (var e = 0; e < a; e++) {
            if (b == d.substr(e, g)) {
                h++
            }
        }
        return h
    },
    trim: function(a) {
        return (a + "").replace(/^\s+/, "").replace(/\s+$/, "")
    }
};
YamlDumper = function() {};
YamlDumper.prototype = {
    dump: function(g, f, c) {
        if (f == undefined) {
            f = 0
        }
        if (c == undefined) {
            c = 0
        }
        var b = "";
        var e = c ? this.strRepeat(" ", c) : "";
        var i;
        if (f <= 0 || !this.isObject(g) || this.isEmpty(g)) {
            i = new YamlInline();
            b += e + i.dump(g)
        } else {
            var d = !this.arrayEquals(this.getKeys(g), this.range(0, g.length - 1));
            var a;
            for (var h in g) {
                if (g.hasOwnProperty(h)) {
                    a = f - 1 <= 0 || !this.isObject(g[h]) || this.isEmpty(g[h]);
                    if (d) {
                        i = new YamlInline()
                    }
                    b += e + "" + (d ? i.dump(h) + ":" : "-") + "" + (a ? " " : "\n") + "" + this.dump(g[h], f - 1, (a ? 0 : c + 2)) + "" + (a ? "\n" : "")
                }
            }
        }
        return b
    },
    strRepeat: function(d, c) {
        var b;
        var a = "";
        for (b = 0; b < c; b++) {
            a += d
        }
        return d
    },
    isObject: function(a) {
        return typeof(a) == "object" && this.isDefined(a)
    },
    isEmpty: function(a) {
        return a == undefined || a == null || a == "" || a == 0 || a == "0" || a == false
    },
    isDefined: function(a) {
        return a != undefined && a != null
    },
    getKeys: function(c) {
        var b = [];
        for (var a in c) {
            if (c.hasOwnProperty(a)) {
                b.push(a)
            }
        }
        return b
    },
    range: function(d, a) {
        if (d > a) {
            return []
        }
        var b = [];
        for (var c = d; c <= a; c++) {
            b.push(c)
        }
        return b
    },
    arrayEquals: function(e, d) {
        if (e.length != d.length) {
            return false
        }
        var c = e.length;
        for (var f = 0; f < c; f++) {
            if (e[f] != d[f]) {
                return false
            }
        }
        return true
    }
};