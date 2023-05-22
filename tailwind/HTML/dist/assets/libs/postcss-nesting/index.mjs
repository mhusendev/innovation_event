import e from"postcss-selector-parser";import{selectorSpecificity as n}from"@csstools/selector-specificity";function t(e){if(!e.nodes.length)return void e.remove();const n=e.nodes.filter((e=>"comment"===e.type));n.length===e.nodes.length&&e.replaceWith(...n)}function o(e,n){const o=n.index(e);if(o){const e=n.cloneBefore().removeAll().append(n.nodes.slice(0,o));e.raws.semicolon=!0,t(e)}n.before(e),n.raws.semicolon=!0}function r(e,n){if(n<2)throw new Error("n must be greater than 1");if(e.length<2)throw new Error("s must be greater than 1");if(Math.pow(e.length,n)>1e4)throw new Error("Too many combinations when trying to resolve a nested selector with lists, reduce the complexity of your selectors");const t=[];for(let e=0;e<n;e++)t[e]=0;const o=[];for(;;){const r=[];for(let s=n-1;s>=0;s--){let n=t[s];if(n>=e.length){if(n=0,t[s]=0,0===s)return o;t[s-1]+=1}r[s]=e[n]}o.push(r),t[t.length-1]++}}const s=e.pseudo({value:":is"});function c(n){if(!n||!n.nodes)return;const t=[];let o=[];for(let r=0;r<n.nodes.length;r++)if("combinator"!==n.nodes[r].type)if(e.isPseudoElement(n.nodes[r]))t.push(o),o=[n.nodes[r]];else{if("tag"===n.nodes[r].type&&o.find((e=>"tag"===e.type))){const t=s.clone({}),o=n.nodes[r];o.replaceWith(t),t.append(e.selector({nodes:[o],value:void 0}))}o.push(n.nodes[r])}else t.push(o),t.push([n.nodes[r]]),o=[];t.push(o);const r=[];for(let e=0;e<t.length;e++){const n=t[e];n.sort(((e,n)=>"selector"===e.type&&"selector"===n.type&&e.nodes.length&&n.nodes.length?l(e.nodes[0])-l(n.nodes[0]):"selector"===e.type&&e.nodes.length?l(e.nodes[0])-l(n):"selector"===n.type&&n.nodes.length?l(e)-l(n.nodes[0]):l(e)-l(n)));for(let e=0;e<n.length;e++)r.push(n[e])}for(let e=r.length-1;e>=0;e--)r[e].remove(),n.prepend(r[e])}function l(n){return e.isPseudoElement(n)?i.pseudoElement:i[n.type]}const i={universal:0,tag:1,pseudoElement:2,id:3,class:4,attribute:5,pseudo:6,selector:7,string:8,root:9,comment:10};function p(t,o,s){let l=[];l=function(t){const o=t.map((n=>e().astSync(n))).map((e=>n(e))),r=o[0];for(let e=1;e<o.length;e++)if(r.a!==o[e].a||r.b!==o[e].b||r.c!==o[e].c)return!1;return!0}(t)||s.noIsPseudoSelector?t.map((n=>e().astSync(n))):[e().astSync(`:is(${t.join(",")})`)];const i=[];for(let n=0;n<o.length;n++){const t=o[n];let p=1,h=[],m=0;if(e().astSync(t).walkNesting((()=>{m++})),m>1&&l.length>1)h=r(l,m),p=h.length;else{p=l.length;for(let e=0;e<l.length;e++){h.push([]);for(let n=0;n<m;n++)h[e].push(l[e])}}for(let n=0;n<p;n++){let o=0;const r=e().astSync(t);r.walk((t=>{if("nesting"!==t.type)return;let r=h[n][o];o++,"root"===r.type&&1===r.nodes.length&&(r=r.nodes[0]);const l=e().astSync(`:is(${r.toString()})`),i=a(r.nodes[0]),p=u(r.nodes[0]),m=a(t),g=u(t);if(i&&m)return void t.replaceWith(r.clone());if((i||p)&&(m||g)){const e=t.parent;return i&&"selector"===r.type?t.replaceWith(r.clone().nodes[0]):t.replaceWith(...r.clone().nodes),void(e&&e.nodes.length>1&&c(e))}if(i){const e=t.parent;return t.replaceWith(r.clone().nodes[0]),void(e&&c(e))}if(p){const e=t.parent;return t.replaceWith(...r.clone().nodes),void(e&&c(e))}if(d(t)){const e=t.parent;return t.replaceWith(...r.clone().nodes),void(e&&c(e))}if(f(t)){const e=t.parent;return t.replaceWith(...r.clone().nodes),void(e&&c(e))}const y=t.parent;s.noIsPseudoSelector?t.replaceWith(...r.clone().nodes):t.replaceWith(...l.clone({}).nodes),y&&c(y)})),i.push(r.toString())}}return i}function a(e){return"combinator"!==e.type&&!(e.parent&&e.parent.nodes.length>1)}function u(e,n=null){if(a(e))return!1;if(!e.parent)return!1;if(!!e.parent.nodes.find((e=>"combinator"===e.type)))return!1;return!(!!e.parent.nodes.find((e=>"nesting"===e.type))&&n&&!u(n))}function d(e){if(!e.parent)return!1;if(0!==e.parent.nodes.indexOf(e))return!1;for(let n=1;n<e.parent.nodes.length;n++)if("combinator"===e.parent.nodes[n].type&&" "!==e.parent.nodes[n].value&&">"!==e.parent.nodes[n].value)return!1;return!0}function f(e){if(a(e))return!0;if(!e.parent)return!1;for(let n=0;n<e.parent.nodes.length;n++)if("nesting"!==e.parent.nodes[n].type&&(e.parent.nodes[n].prev()||e.parent.nodes[n].next())){if(e.parent.nodes[n].prev()&&"combinator"!==e.parent.nodes[n].prev().type)return!1;if(e.parent.nodes[n].next()&&"combinator"!==e.parent.nodes[n].next().type)return!1}return!0}function h(e){const n=[];let t="",o=!1,r=0,s=!1,c=!1;for(const l of e)c?c=!1:"\\"===l?c=!0:s?l===s&&(s=!1):'"'===l||"'"===l?s=l:"("===l?r+=1:")"===l?r>0&&(r-=1):0===r&&","===l&&(o=!0),o?(""!==t&&n.push(t.trim()),t="",o=!1):t+=l;return n.push(t.trim()),n}var m=["container","document","media","supports","layer"];function g(e,n){var r,s;o(e,n),e.params=(r=n.params,s=e.params,h(r).map((e=>h(s).map((n=>`${e} and ${n}`)).join(", "))).join(", ")),t(n)}function y(e){return e&&"atrule"===e.type}function v(e){return e&&"rule"===e.type}function b(e,n){e.each((e=>{const r=e.parent;v(e)&&v(r)&&function(e){return e.selectors.every((e=>0===e.trim().indexOf("&")&&-1===e.indexOf("|")))}(e)?function(e,n,r){o(e,n),e.selectors=p(n.selectors,e.selectors,r),"rule"===e.type&&"rule"===n.type&&e.selector===n.selector&&e.append(...n.nodes),t(n)}(e,r,n):function(e){return e&&y(e)&&"nest"===e.name}(e)&&v(r)&&function(e){return h(e.params).every((e=>e.split("&").length>=2&&-1===e.indexOf("|")))}(e)?function(e,n,r,s){o(e,n);const c=n.clone().removeAll().append(e.nodes);c.raws.semicolon=!0,e.replaceWith(c),c.selectors=p(n.selectors,h(e.params),s),t(n),r(c,s)}(e,r,b,n):y(e)&&v(r)&&function(e){return m.includes(e.name)}(e)?function(e,n,r,s){o(e,n);const c=n.clone().removeAll().append(e.nodes);e.append(c),t(n),r(c,s)}(e,r,b,n):y(e)&&y(r)&&function(e,n){return m.includes(e.name)&&e.name===n.name}(e,r)&&g(e,r),"nodes"in e&&e.nodes.length&&b(e,n)}))}const w=e=>{const n=Object.assign({noIsPseudoSelector:!1},e);return{postcssPlugin:"postcss-nesting",Rule(e){b(e,n)}}};w.postcss=!0;export{w as default};
