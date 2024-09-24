"use strict";(globalThis.webpackChunk=globalThis.webpackChunk||[]).push([["keyboard-shortcuts-dialog"],{12480:(e,t,i)=>{i.d(t,{U0:()=>s});var n=i(97156);let r={Android:"Android",iOS:"iOS",macOS:"macOS",Windows:"Windows",Linux:"Linux",Unknown:"Unknown"};function s(){return function(){let e=r.Unknown,t=!1;if(n.cg){let i=n.cg.navigator,s=i.userAgent,a=i?.userAgentData?.platform||i.platform;-1!==["Macintosh","MacIntel","MacPPC","Mac68K","macOS"].indexOf(a)?e=r.macOS:-1!==["iPhone","iPad","iPod"].indexOf(a)?e=r.iOS:-1!==["Win32","Win64","Windows","WinCE"].indexOf(a)?e=r.Windows:/Android/.test(s)?e=r.Android:/Linux/.test(a)&&(e=r.Linux),t=i?.userAgentData?.mobile??(e===r.Android||e===r.iOS)}return{os:e,isAndroid:e===r.Android,isIOS:e===r.iOS,isMacOS:e===r.macOS,isWindows:e===r.Windows,isLinux:e===r.Linux,isDesktop:e===r.macOS||e===r.Windows||e===r.Linux,isMobile:t}}().isMacOS}},18558:(e,t,i)=>{i.d(t,{JC:()=>n.JC,KK:()=>n.KK,SK:()=>s,Vy:()=>n.Vy,ai:()=>n.ai,oc:()=>n.oc,rd:()=>n.rd});var n=i(50515);let r=/(?:^|,)((?:[^,]|,(?=\+| |$))*(?:,(?=,))?)/g;function s(e){return Array.from(e.matchAll(r)).map(([,e])=>e)}},98164:(e,t,i)=>{i.d(t,{$$:()=>o,GI:()=>s,zw:()=>r});var n=i(18558);let r=()=>{if("undefined"==typeof document)return!1;let e=document.querySelector("meta[name=keyboard-shortcuts-preference]");return!e||"all"===e.content},s=e=>/Enter|Arrow|Escape|Meta|Control|Mod|Esc/.test(e)||e.includes("Alt")&&e.includes("Shift"),a=new Set(["button","checkbox","color","file","hidden","image","radio","range","reset","submit"]),o=e=>{let t=(0,n.Vy)(e),i=r()&&!function(e){if(!(e instanceof HTMLElement))return!1;let t=e.nodeName.toLowerCase(),i=e.getAttribute("type")?.toLowerCase()??"text",n="true"===e.ariaReadOnly||"true"===e.getAttribute("aria-readonly")||null!==e.getAttribute("readonly");return("select"===t||"textarea"===t||"input"===t&&!a.has(i)||e.isContentEditable)&&!n}(e.target);return s(t)||i}},34968:(e,t,i)=>{var n=i(72245),r=i(74848),s=i(96540),a=i(26750),o=i(75177),l=i(38553),d=i(55847),u=i(86079),c=i(8784);function m({group:{service:{name:e},commands:t}}){let i=(0,s.useId)();return(0,r.jsxs)(o.A,{sx:{borderRadius:2,border:"1px solid",borderColor:"border.default",overflow:"hidden"},children:[(0,r.jsx)(o.A,{as:"h3",id:i,sx:{bg:"canvas.subtle",fontWeight:"bold",py:2,px:3,fontSize:1},children:e}),(0,r.jsx)(o.A,{as:"ul",role:"list","aria-labelledby":i,sx:{listStyleType:"none"},children:t.map(({id:e,name:t,keybinding:i})=>(0,r.jsxs)(o.A,{as:"li",sx:{borderTop:"1px solid",borderColor:"border.default",py:2,px:3,display:"flex",gap:2,justifyContent:"space-between",alignItems:"center"},children:[(0,r.jsx)("div",{children:t}),(0,r.jsx)(o.A,{sx:{textAlign:"right"},children:(Array.isArray(i)?i:[i]).map((e,t)=>(0,r.jsxs)(s.Fragment,{children:[t>0&&" or ",(0,r.jsx)(c.U,{keys:e})]},e))})]},e))})]})}try{m.displayName||(m.displayName="ShortcutsGroupList")}catch{}let p={keyboardShortcuts:"Keyboard shortcuts",siteWideShortcuts:"Site-wide shortcuts",loading:"Loading"};i(89794);var f=i(58033),h=i(28784),g=i(18558);let v=()=>(0,r.jsxs)(o.A,{role:"status",sx:{display:"flex",height:"100%",justifyContent:"center",alignItems:"center"},children:[(0,r.jsx)(l.A,{size:"large"}),(0,r.jsx)("span",{className:"sr-only",children:p.loading})]}),y=e=>Array.isArray(e)?e.map(e=>(0,g.rd)(e)):(0,g.rd)(e??""),b=({children:e})=>(0,r.jsx)(o.A,{sx:{display:"flex",flexDirection:"row",gap:2,flexWrap:"wrap"},children:e}),w=({children:e})=>(0,r.jsx)(o.A,{sx:{flex:"250px",display:"flex",flexDirection:"column",gap:2},children:e}),x=({visible:e,onVisibleChange:t,docsUrl:i})=>{let[n,a]=(0,s.useState)({service:{id:"global",name:"Global"},commands:[]}),[o,l]=(0,s.useState)([]),[c,g]=(0,s.useState)(!1);return((0,s.useEffect)(()=>{let t=(0,f.c)(),i=async()=>{g(!0);let e=document.querySelector("meta[name=github-keyboard-shortcuts]");if(!e)throw Error('The "github-keyboard-shortcuts" meta tag must be present');let i={contexts:e.content},n=`/site/keyboard_shortcuts?${new URLSearchParams(i).toString()}`,r=await (0,h.lS)(n,{method:"GET"});if(r.ok){let{global:e,...i}=(await r.json()).commands;a({service:{id:"global",name:p.siteWideShortcuts},commands:[...e.commands,...t.find(e=>"global"===e.service.id)?.commands??[]].map(e=>({...e,keybinding:y(e.keybinding)}))}),l([...Object.values(i),...t].map(e=>({...e,commands:e.commands.map(e=>({...e,keybinding:y(e.keybinding)}))})))}else l(t.map(e=>({...e,commands:e.commands.map(e=>({...e,keybinding:y(e.keybinding)}))})));g(!1)};e&&i()},[e]),e)?(0,r.jsx)(u.l,{title:p.keyboardShortcuts,"aria-modal":"true",width:"xlarge",height:"large",onClose:()=>t(!1),sx:{color:"fg.default"},children:c?(0,r.jsx)(v,{}):(0,r.jsxs)(b,{children:[(0,r.jsx)(w,{children:o.map(e=>(0,r.jsx)(m,{group:e},e.service.id))}),(0,r.jsxs)(w,{children:[(0,r.jsx)(m,{group:n},n.service.id),(0,r.jsx)(d.Q,{as:"a",href:i,sx:{width:"100%"},children:"View all keyboard shortcuts"})]})]})}):null};try{v.displayName||(v.displayName="LoadingState")}catch{}try{b.displayName||(b.displayName="Columns")}catch{}try{w.displayName||(w.displayName="Column")}catch{}try{x.displayName||(x.displayName="ShortcutsDialog")}catch{}var E=i(97564);function k({docsUrl:e}){let[t,i]=(0,s.useState)(!1);return(0,E.G7)("react_keyboard_shortcuts_dialog")?(0,r.jsxs)(r.Fragment,{children:[(0,r.jsx)(a.ak,{commands:{"keyboard-shortcuts-dialog:show-dialog":()=>i(!0)}}),(0,r.jsx)(x,{visible:t,onVisibleChange:i,docsUrl:e})]}):(0,r.jsx)(r.Fragment,{})}try{k.displayName||(k.displayName="KeyboardShortcutsDialog")}catch{}(0,n.k)("keyboard-shortcuts-dialog",{Component:k})},92536:(e,t,i)=>{i.d(t,{R:()=>DeferredRegistry});let DeferredRegistry=class DeferredRegistry{register(e,t){let i=this.registrationEntries[e];i?i.resolve?.(t):this.registrationEntries[e]={promise:Promise.resolve(t)}}getRegistration(e){var t;return(t=this.registrationEntries)[e]||(t[e]=new n),this.registrationEntries[e].promise}constructor(){this.registrationEntries={}}};let n=class Deferred{constructor(){this.promise=new Promise(e=>{this.resolve=e})}}},75014:(e,t,i)=>{i.d(t,{Mm:()=>s,QJ:()=>a,w8:()=>r});var n=i(96540);function r(e){return((0,n.useEffect)(()=>{let t=e?.anchor;t&&("disabled"in t&&(t.disabled=!1),t.classList.remove("cursor-wait"))},[e]),e)?{reactPartialAnchor:{__wrapperElement:e}}:{}}function s(e){let t=(0,n.useRef)(e.__wrapperElement.anchor||null),[i,r]=(0,n.useState)(!1),s=(0,n.useCallback)(()=>{r(!i)},[i,r]);return(0,n.useEffect)(()=>{t.current&&(t.current.setAttribute("aria-expanded",i.toString()),t.current.setAttribute("aria-haspopup","true"))},[t,i]),a(e,s),{ref:t,open:i,setOpen:r}}function a(e,t){let i=(0,n.useRef)(e.__wrapperElement.anchor);(0,n.useEffect)(()=>{let e=i.current;if(e)return e.addEventListener("click",t),()=>e.removeEventListener("click",t)},[i,t])}},72245:(e,t,i)=>{i.d(t,{k:()=>d});let n=new(i(92536)).R;var r=i(74848),s=i(39595),a=i(24508),o=i(23235);let l=class ReactPartialElement extends a.H{async getReactNode(e,t){var i;let{Component:s}=await (i=this.name,n.getRegistration(i)),a=this.closest("react-partial-anchor");return(0,r.jsx)(o.c,{partialName:this.name,embeddedData:e,Component:s,wasServerRendered:this.hasSSRContent,ssrError:this.ssrError,anchorElement:a,onError:t})}constructor(...e){super(...e),this.nameAttribute="partial-name"}};function d(e,t){n.register(e,t)}l=function(e,t,i,n){var r,s=arguments.length,a=s<3?t:null===n?n=Object.getOwnPropertyDescriptor(t,i):n;if("object"==typeof Reflect&&"function"==typeof Reflect.decorate)a=Reflect.decorate(e,t,i,n);else for(var o=e.length-1;o>=0;o--)(r=e[o])&&(a=(s<3?r(a):s>3?r(t,i,a):r(t,i))||a);return s>3&&a&&Object.defineProperty(t,i,a),a}([s.p_],l)},23581:(e,t,i)=>{i.d(t,{A:()=>o});let{getItem:n,setItem:r,removeItem:s}=(0,i(74572).A)("localStorage"),a="REACT_PROFILING_ENABLED",o={enable:()=>r(a,"true"),disable:()=>s(a),isEnabled:()=>!!n(a)}},35311:(e,t,i)=>{i.d(t,{J:()=>r,k:()=>CommandEvent});var n=i(89794);let CommandEvent=class CommandEvent{constructor(e){this.commandId=e}};let r={entries:e=>Object.entries(e).filter(e=>n.dx.is(e[0])&&void 0!==e[1]),keys:e=>Object.keys(e).filter(n.dx.is)}},58033:(e,t,i)=>{i.d(t,{J:()=>l,c:()=>o});var n=i(96540),r=i(35311),s=i(89794);let a=new Map;function o(){let e=new Map;for(let t of new Set(Array.from(a.values()).flat())){let i=s.dx.getServiceId(t);if(!e.has(i)){let t=(0,s.tp)(i);e.set(i,{service:{id:t.id,name:t.name},commands:[]})}let n=(0,s.fL)(t);n&&n.defaultBinding&&e.get(i)?.commands.push({id:t,name:n.name,description:n.description,keybinding:n.defaultBinding})}return Array.from(e.values())}let l=e=>{let t=(0,n.useId)();(0,n.useEffect)(()=>(a.set(t,r.J.keys(e)),()=>{a.delete(t)}),[e,t])}},89794:(e,t,i)=>{i.d(t,{dx:()=>l,fL:()=>d,xJ:()=>c,eY:()=>m,tp:()=>u});var n=i(97564),r=i(18558);let{P:s,$:a}=JSON.parse('{"$":{"commit-diff-view":{"id":"commit-diff-view","name":"Commits diff view","commandIds":["commit-diff-view:open-find","commit-diff-view:create-permalink"]},"github":{"id":"github","name":"GitHub (site-wide)","commandIds":["github:submit-form","github:open-context-menu","github:select-multiple"]},"issue-create":{"id":"issue-create","name":"Issue Create","commandIds":["issue-create:new","issue-create:submit-and-create-more","issue-create:open-fullscreen"]},"issue-viewer":{"id":"issue-viewer","name":"Issue viewer","commandIds":["issue-viewer:edit-parent","issue-viewer:edit-title-submit","issue-viewer:close-edit-title"]},"issues-react":{"id":"issues-react","name":"Issues","commandIds":["issues-react:focus-next-issue","issues-react:focus-previous-issue"]},"item-pickers":{"id":"item-pickers","name":"Item Pickers","commandIds":["item-pickers:open-assignees","item-pickers:open-development","item-pickers:open-labels","item-pickers:open-milestone","item-pickers:open-projects","item-pickers:open-issue-type","item-pickers:open-author"]},"keyboard-shortcuts-dialog":{"id":"keyboard-shortcuts-dialog","name":"Keyboard Shortcuts Dialog","commandIds":["keyboard-shortcuts-dialog:show-dialog"]},"list-view-items-issues-prs":{"id":"list-view-items-issues-prs","name":"List View Items: Issues & Pull Requests","commandIds":["list-view-items-issues-prs:open-focused-item","list-view-items-issues-prs:toggle-focused-item-selection"]},"list-views":{"id":"list-views","name":"List views including lists of issues, pull requests, discussions, and notifications.","commandIds":["list-views:open-manage-item-dialog"]},"projects":{"id":"projects","name":"Projects","commandIds":["projects:save-view","projects:save-form"]},"pull-requests-diff-file-tree":{"id":"pull-requests-diff-file-tree","name":"Pull requests - diff file tree","commandIds":["pull-requests-diff-file-tree:focus-file-tree"]},"pull-requests-diff-view":{"id":"pull-requests-diff-view","name":"Pull requests - \'Files changed\' view","commandIds":["pull-requests-diff-view:copy-code","pull-requests-diff-view:expand-all-hunks","pull-requests-diff-view:expand-hunk-up","pull-requests-diff-view:expand-hunk-down","pull-requests-diff-view:copy-anchor-link","pull-requests-diff-view:start-conversation-current","pull-requests-diff-view:jump-to-next-result","pull-requests-diff-view:jump-to-next-result-alternate","pull-requests-diff-view:jump-to-previous-result","pull-requests-diff-view:jump-to-previous-result-alternate","pull-requests-diff-view:open-find","pull-requests-diff-view:close-find"]},"react-sandbox":{"id":"react-sandbox","name":"React Sandbox","commandIds":["react-sandbox:example-command"]},"sub-issues":{"id":"sub-issues","name":"sub-issues","commandIds":["sub-issues:create-sub-issue","sub-issues:add-existing-issue"]}},"P":{"commit-diff-view:create-permalink":{"name":"Create permalink","description":"Hotkey to expand the current url to a full permalink.","defaultBinding":"y"},"commit-diff-view:open-find":{"name":"Open up find and search on selection","description":"Hotkey to open up the custom find and search on selection.","defaultBinding":"Mod+e"},"github:open-context-menu":{"name":"Open context menu","description":"Open a context menu if one is available","defaultBinding":"Alt+Shift+C"},"github:select-multiple":{"name":"Select multiple items","description":"Add the current item to a multi-selection (or remove it if already added)","defaultBinding":"Mod+Enter"},"github:submit-form":{"name":"Submit form","description":"Submit the current form","defaultBinding":"Mod+Enter"},"issue-create:new":{"name":"Create a new issue","description":"Initiate new issue creation","defaultBinding":"c"},"issue-create:open-fullscreen":{"name":"Open in fullscreen","description":"Open the issue creation dialog in fullscreen mode","defaultBinding":"Mod+Shift+Enter"},"issue-create:submit-and-create-more":{"name":"Submit and create more","description":"Submit the current issue and create a new one","defaultBinding":"Mod+Alt+Enter"},"issue-viewer:close-edit-title":{"name":"Cancel","description":"Cancel out of editing an issue\'s title","defaultBinding":"Escape"},"issue-viewer:edit-parent":{"name":"Edit parent","description":"Edit parent for current issue","defaultBinding":"Alt+Shift+P"},"issue-viewer:edit-title-submit":{"name":"Save","description":"Submit changes made to an issue\'s title","defaultBinding":"Enter"},"issues-react:focus-next-issue":{"name":"Focus on Next Issue","description":"Focus on the next issue in the list, or the first one if none are focused.","defaultBinding":"j"},"issues-react:focus-previous-issue":{"name":"Focus on Previous Issue","description":"Focus on the previous issue in the list","defaultBinding":"k"},"item-pickers:open-assignees":{"name":"Open assignees panel","description":"Open panel to select assignees","defaultBinding":"a"},"item-pickers:open-author":{"name":"Open author panel","description":"Open panel to select author","defaultBinding":"u"},"item-pickers:open-development":{"name":"Open development panel","description":"Open panel to create or link a pull request","defaultBinding":"d"},"item-pickers:open-issue-type":{"name":"Open issue type panel","description":"Open panel to select issue type","defaultBinding":"t"},"item-pickers:open-labels":{"name":"Open labels panel","description":"Open panel to select labels","defaultBinding":"l"},"item-pickers:open-milestone":{"name":"Open milestone panel","description":"Open panel to select milestone","defaultBinding":"m"},"item-pickers:open-projects":{"name":"Open projects panel","description":"Open panel to select projects","defaultBinding":"p"},"keyboard-shortcuts-dialog:show-dialog":{"name":"Show Keyboard Shortcuts Dialog","description":"Display the keyboard shortcuts help dialog","defaultBinding":"Shift+?"},"list-view-items-issues-prs:open-focused-item":{"name":"Open Focused Item","description":"Open the currently focused item","defaultBinding":"o"},"list-view-items-issues-prs:toggle-focused-item-selection":{"name":"Toggle Focused Item Selection","description":"Toggle the selection state of the currently focused item for bulk actions","defaultBinding":"x"},"list-views:open-manage-item-dialog":{"name":"Open \'manage item\' dialog","defaultBinding":"Mod+Shift+U","description":"Open a dialog to manage the currently focused item."},"projects:save-form":{"name":"Save","description":"Submits the currently focused form.","defaultBinding":"Mod+Enter"},"projects:save-view":{"name":"Save view","description":"Save any unsaved changes to the current project view.","defaultBinding":"Mod+s"},"pull-requests-diff-file-tree:focus-file-tree":{"name":"Focus file tree","description":"Move focus to the file tree","defaultBinding":"Mod+F6","featureFlag":"prx"},"pull-requests-diff-view:close-find":{"name":"Close Find","description":"Close the find window","defaultBinding":"Escape"},"pull-requests-diff-view:copy-anchor-link":{"name":"Copy link","description":"Copy link to the current line","defaultBinding":"Mod+Alt+y"},"pull-requests-diff-view:copy-code":{"name":"Copy","description":"Copy the code for the current line(s)","defaultBinding":"Mod+c"},"pull-requests-diff-view:expand-all-hunks":{"name":"Expand all","description":"Expand all hunks in the current file","defaultBinding":"Mod+Shift+ArrowLeft"},"pull-requests-diff-view:expand-hunk-down":{"name":"Expand below","description":"Expand the current hunk downward"},"pull-requests-diff-view:expand-hunk-up":{"name":"Expand above","description":"Expand the current hunk upward"},"pull-requests-diff-view:jump-to-next-result":{"name":"Jump to the next search result","description":"Jump to the next search result","defaultBinding":"Enter"},"pull-requests-diff-view:jump-to-next-result-alternate":{"name":"Jump to the next search result","description":"Jump to the next search result","defaultBinding":"Mod+g"},"pull-requests-diff-view:jump-to-previous-result":{"name":"Jump to the previous search result","description":"Jump to the previous search result","defaultBinding":"Shift+Enter"},"pull-requests-diff-view:jump-to-previous-result-alternate":{"name":"Jump to the previous search result","description":"Jump to the previous search result","defaultBinding":"Mod+Shift+G"},"pull-requests-diff-view:open-find":{"name":"Open up find","description":"Hotkey to open up the custom find.","defaultBinding":"Mod+f"},"pull-requests-diff-view:start-conversation-current":{"name":"Start conversation on line","description":"Start a conversation on the current line"},"react-sandbox:example-command":{"name":"React Sandbox Example Command","description":"Do something.","defaultBinding":"Mod+Shift+Enter"},"sub-issues:add-existing-issue":{"name":"Add existing issue","description":"Add an existing issue as a sub-issue","defaultBinding":"Alt+Shift+A"},"sub-issues:create-sub-issue":{"name":"Create sub-issue","description":"Create a new sub-issue","defaultBinding":"Alt+Shift+C"}}}'),o=new Set(Object.keys(s)),l={is:e=>o.has(e),getServiceId:e=>e.split(":")[0]},d=e=>{let t=s[e];return!t.featureFlag||(0,n.G7)(t.featureFlag.toUpperCase())?t:void 0},u=e=>a[e],c=e=>{let t=d(e);return t?.defaultBinding?(0,r.rd)(t.defaultBinding):void 0},m=e=>new Map(e.map(e=>[e,c(e)]).filter(e=>void 0!==e[1]))},26750:(e,t,i)=>{i.d(t,{Vr:()=>j,cQ:()=>C,ky:()=>r.k,N5:()=>O,hh:()=>_,ak:()=>w,tL:()=>M});var n,r=i(35311),s=i(89794),a=i(74848),o=i(16823),l=i(96540),d=i(58033);let u=new(i(18679)).s({collectorUrl:"https://collector.githubapp.com/ui-commands/collect"}),c={TYPE:"command.trigger",send(e){u.sendEvent(c.TYPE,e)}};function m(e,t){c.send({command_id:e.commandId,trigger_type:t instanceof KeyboardEvent?"keybinding":"click",target_element_html:t.target instanceof HTMLElement?function(e){let t=e.tagName.toLowerCase(),i=Array.from(e.attributes).map(e=>`${e.name}="${e.value.replaceAll('"','\\"')}"`).join(" ");return`<${t}${i?` ${i}`:""}>`}(t.target):void 0,keybinding:(0,s.xJ)(e.commandId)})}let p=new Map;function f(e,t){let i=(0,l.useMemo)(()=>new Map,[]),n="global"===e?p:i;(0,l.useEffect)(()=>{for(let[e,i]of(0,s.eY)(r.J.keys(t))){let t=n.get(i)?.filter(t=>t!==e)??[];t.length&&console.warn(`The keybinding (${i}) for the "${e}" command conflicts with the keybinding for the already-registered command(s) "${t.join(", ")}". This may result in unpredictable behavior.`),n.set(i,t.concat(e))}return()=>{for(let[e,i]of(0,s.eY)(r.J.keys(t))){let t=function(e,t){let i=!1;return e.filter(e=>e!==t||!!i||(i=!0,!1))}(n.get(i)??[],e);t?.length?n.set(i,t):n.delete(i)}}},[t,n])}var h=i(97564),g=i(18558),v=i(98164);function y(e,t,i){let n=(0,h.G7)("ui_commands_respect_modals"),r=(0,l.useMemo)(()=>new g.KK,[]),a=(0,l.useMemo)(()=>{let t=new Map;for(let i of e){let e=(0,s.xJ)(i);e&&t.set(e,i)}return t},[e]),o=(0,l.useRef)(null);return(0,l.useCallback)(e=>{let s="nativeEvent"in e?e.nativeEvent:e;if(o.current===s)return;if(o.current=s,!(0,v.$$)(s)){r.reset();return}r.registerKeypress(s);let l=a.get(r.sequence)??a.get((0,g.Vy)(s));l&&(!n||void 0===i||i())&&(r.reset(),e.preventDefault(),e.stopPropagation(),s.stopImmediatePropagation(),t(l,s))},[a,r,t,i,n])}let b="ui-command-trigger",w=({commands:e})=>{let t=(0,l.useRef)(null),i=(0,l.useCallback)((t,i)=>{let n=e[t];if(n){let e=new r.k(t);try{n(e)}finally{m(e,i)}}},[e]),n=(0,l.useCallback)(()=>{let e=function(){let e=[...document.querySelectorAll('dialog:modal, [role="dialog"][aria-modal="true"]')].filter(e=>e.childNodes.length>0&&function e(t){if(t.clientHeight>0)return!0;for(let i of t.children)if(e(i))return!0;return!1}(e));return e.length?e[e.length-1]:null}();return!e||function(e,t){return!!t&&(e.contains(t)??!1)}(e,t.current)},[]),o=y(r.J.keys(e),i,n);return f("global",e),(0,d.J)(e),(0,l.useEffect)(()=>{let e=e=>{let t="detail"in e&&"object"==typeof e.detail?e.detail:void 0;if(!t)return;let n="commandId"in t&&"string"==typeof t.commandId&&s.dx.is(t.commandId)?t.commandId:void 0,r="domEvent"in t&&(t.domEvent instanceof KeyboardEvent||t.domEvent instanceof MouseEvent)?t.domEvent:void 0;n&&r&&i(n,r)};return document.addEventListener("keydown",o),document.addEventListener(b,e),()=>{document.removeEventListener("keydown",o),document.removeEventListener(b,e)}},[o,i,t]),(0,a.jsx)("div",{ref:t,className:"d-none"})};try{w.displayName||(w.displayName="GlobalCommands")}catch{}let x=(0,l.createContext)({triggerCommand:function(e,t){document.dispatchEvent(new CustomEvent(b,{detail:{commandId:e,domEvent:t}}))}}),E=x.Provider,k=()=>(0,l.useContext)(x);var S=i(8784);let _=({commandId:e,...t})=>{let i=(0,s.xJ)(e);return i?(0,a.jsx)(S.U,{keys:i,...t}):null};try{_.displayName||(_.displayName="CommandKeybindingHint")}catch{}let j=(0,l.forwardRef)(({commandId:e,children:t,description:i,leadingVisual:n,trailingVisual:r,...l},d)=>{let u=(0,s.fL)(e),{triggerCommand:c}=k();return u?(0,a.jsxs)(o.l.Item,{...l,onSelect:t=>c(e,t.nativeEvent),ref:d,children:[t??u.name,i&&(0,a.jsx)(o.l.Description,{children:i}),n&&(0,a.jsx)(o.l.LeadingVisual,{children:n}),null!==r&&(0,a.jsx)(o.l.TrailingVisual,{children:r??(0,a.jsx)(_,{commandId:e,format:"condensed"})})]}):null});j.displayName="ActionList.CommandItem";var R=i(55847);let C=(0,l.forwardRef)(({commandId:e,children:t,trailingVisual:i,showKeybindingHint:n=!1,keybindingHintVariant:r,...o},l)=>{let d=(0,s.fL)(e),{triggerCommand:u}=k();if(!d)return null;let c=r??("primary"===o.variant?"onEmphasis":"normal");return(0,a.jsx)(R.Q,{...o,onClick:t=>u(e,t.nativeEvent),trailingVisual:i??n?()=>(0,a.jsxs)(a.Fragment,{children:[(0,a.jsx)("span",{className:"sr-only",children:"("}),(0,a.jsx)(_,{commandId:e,format:"condensed",variant:c}),(0,a.jsx)("span",{className:"sr-only",children:")"})]}):void 0,ref:l,children:t??d.name})});C.displayName="CommandButton";try{(n=HintVisual).displayName||(n.displayName="HintVisual")}catch{}var A=i(87330);let O=(0,l.forwardRef)(({commandId:e,"aria-label":t,...i},n)=>{let r=(0,s.fL)(e),{triggerCommand:o}=k();return r?(0,a.jsx)(A.K,{...i,"aria-label":t??r.name,onClick:t=>o(e,t.nativeEvent),ref:n}):null});O.displayName="CommandIconButton";var N=i(98152),I=i(10120),B=i(64515);let M=(0,l.forwardRef)(({commands:e,as:t,...i},n)=>{let s=(0,I.M)(e),o=k(),u=(0,l.useCallback)((e,t)=>{let i=s.current[e];if(i){let n=new r.k(e);try{i(n)}finally{m(n,t)}}else o.triggerCommand(e,t)},[s,o]);f("scoped",e),(0,d.J)(e);let c=(0,l.useMemo)(()=>({triggerCommand:u}),[u]),p=y(r.J.keys(e),u),h=(0,N._)(p),g=(0,l.useRef)(null);(0,B.T)(n,g),(0,l.useEffect)(()=>{let e=g.current,t=h.onKeyDown;if(e)return e.addEventListener("keydown",t),()=>e.removeEventListener("keydown",t)});let v=void 0!==t||void 0!==i.className?void 0:{display:"contents"};return(0,a.jsx)(E,{value:c,children:(0,a.jsx)(t??"div",{style:v,...i,...h,ref:g})})});M.displayName="ScopedCommands"},98152:(e,t,i)=>{i.d(t,{_:()=>a});var n=i(12480),r=i(96540);let s=new Set(["enter","tab"]),a=e=>{let t=(0,r.useRef)(!1),i=(0,r.useRef)(!1),a=(0,r.useCallback)(e=>{"compositionstart"===e.type&&(t.current=!0,i.current=!1),"compositionend"===e.type&&(t.current=!1,i.current=!0)},[]),o=(0,r.useCallback)(r=>{if(!s.has(r.key.toLowerCase())||!t.current){if((0,n.U0)()&&229===r.keyCode&&i.current){i.current=!1;return}e(r)}},[e]);return(0,r.useMemo)(()=>({onCompositionStart:a,onCompositionEnd:a,onKeyDown:o}),[a,o])}},51012:(e,t,i)=>{i.d(t,{N:()=>s});var n=i(97156),r=i(96540);let s=void 0!==n.cg?.document?.createElement?r.useLayoutEffect:r.useEffect},10120:(e,t,i)=>{i.d(t,{M:()=>s});var n=i(51012),r=i(96540);function s(e){let t=(0,r.useRef)(e);return(0,n.N)(()=>{t.current=e},[e]),t}},28784:(e,t,i)=>{function n(e,t={}){!function(e){if(new URL(e,window.location.origin).origin!==window.location.origin)throw Error("Can not make cross-origin requests from verifiedFetch")}(e);let i={...t.headers,"GitHub-Verified-Fetch":"true","X-Requested-With":"XMLHttpRequest"};return fetch(e,{...t,headers:i})}function r(e,t){let i={...t?.headers??{},Accept:"application/json","Content-Type":"application/json"},r=t?.body?JSON.stringify(t.body):void 0;return n(e,{...t,body:r,headers:i})}function s(e,t={}){let i={...t.headers,"GitHub-Is-React":"true"};return n(e,{...t,headers:i})}function a(e,t){let i={...t?.headers??{},"GitHub-Is-React":"true"};return r(e,{...t,headers:i})}i.d(t,{DI:()=>n,QJ:()=>s,Sr:()=>a,lS:()=>r})},23235:(e,t,i)=>{i.d(t,{c:()=>h});var n=i(74848),r=i(96540),s=i(36165),a=i(45588),o=i(49107),l=i(47767),d=i(59840);function u({children:e,history:t}){let[i,s]=(0,r.useState)({location:t.location});return(0,d.m)(()=>t.listen(s),[t]),(0,n.jsx)(l.Ix,{location:i.location,navigator:t,children:e})}try{u.displayName||(u.displayName="PartialRouter")}catch{}var c=i(17857),m=i(51261),p=i(75014),f=i(44196);function h({partialName:e,embeddedData:t,Component:i,wasServerRendered:l,ssrError:d,anchorElement:h,onError:g}){let v=r.useRef(),y=globalThis.window;v.current||(v.current=y?(0,m.z)({window:y}):(0,a.sC)({initialEntries:[{pathname:"/"}]}));let b=v.current,w=(0,p.w8)(h);return(0,n.jsx)(s.U,{appName:e,wasServerRendered:l,children:(0,n.jsx)(f.t,{onError:g,children:(0,n.jsx)(o.Q,{history:b,routes:[],children:(0,n.jsxs)(u,{history:b,children:[(0,n.jsx)(i,{...t.props,...w}),(0,n.jsx)(c.h,{ssrError:d})]})})})})}try{h.displayName||(h.displayName="PartialEntry")}catch{}},24508:(e,t,i)=>{i.d(t,{H:()=>ReactBaseElement});var n=i(74848),r=i(39595),s=i(5338),a=i(96540),o=i(23581),l=i(79461),d=i(51528);function u(e,t,i,n){var r,s=arguments.length,a=s<3?t:null===n?n=Object.getOwnPropertyDescriptor(t,i):n;if("object"==typeof Reflect&&"function"==typeof Reflect.decorate)a=Reflect.decorate(e,t,i,n);else for(var o=e.length-1;o>=0;o--)(r=e[o])&&(a=(s<3?r(a):s>3?r(t,i,a):r(t,i))||a);return s>3&&a&&Object.defineProperty(t,i,a),a}let c=RegExp("Minified React error #(?<invariant>\\d+)"),m=["419","421"];let ReactBaseElement=class ReactBaseElement extends HTMLElement{get name(){return this.getAttribute(this.nameAttribute)}get embeddedDataText(){let e=this.embeddedData?.textContent;if(!e)throw Error(`No embedded data provided for react element ${this.name}`);return e}get hasSSRContent(){return"true"===this.getAttribute("data-ssr")}get attemptedSSR(){return"true"===this.getAttribute("attempted-ssr")}connectedCallback(){this.renderReact()}disconnectedCallback(){this.root?.unmount(),this.root=void 0}async renderReact(){if(!this.reactRoot)throw Error("No react root provided");let e={createRoot:s.H,hydrateRoot:s.c};o.A.isEnabled()&&(e=await this.getReactDomWithProfiling());let t=!1,i=JSON.parse(this.embeddedDataText),r=this.ssrError?.textContent,l=await this.getReactNode(i,e=>{t=!0,setTimeout(()=>{throw e})}),u=(0,n.jsx)(a.StrictMode,{children:l});if(r&&this.logSSRError(r),this.hasSSRContent){let i=this.querySelector('style[data-styled="true"]');i&&document.head.appendChild(i),this.root=e.hydrateRoot(this.reactRoot,u,{onRecoverableError:e=>{if(!(e instanceof Error))return;let i=c.exec(e.message),n=String(i?.groups?.invariant);t=!m.includes(n),(0,d.i)({incrementKey:"REACT_HYDRATION_ERROR",incrementTags:{appName:this.name,invariant:n}})}}),i&&requestIdleCallback(()=>{i.parentElement?.removeChild(i)}),(0,d.i)({incrementKey:"REACT_RENDER",incrementTags:{appName:this.name,csr:!1,error:t,ssr:!0,ssrError:!1}})}else this.root=e.createRoot(this.reactRoot),this.root.render(u),(0,d.i)({incrementKey:"REACT_RENDER",incrementTags:{appName:this.name,csr:!0,error:t,ssr:this.attemptedSSR,ssrError:!!this.ssrError}});this.classList.add("loaded")}getReactDomWithProfiling(){return i.e("react-profiling").then(i.t.bind(i,87335,19))}logSSRError(e){if(l.z[e])return console.error("SSR failed with an expected error:",l.z[e]);try{let t=JSON.parse(e),i=function(e){if(!e.stacktrace)return"";let t="\n ";return e.stacktrace.map(e=>{let{function:i,filename:n,lineno:r,colno:s}=e,a=`${t} at ${i} (${n}:${r}:${s})`;return t=" ",a}).join("\n")}(t);console.error("Error During Alloy SSR:",`${t.type}: ${t.value}
`,t,i)}catch{console.error("Error During Alloy SSR:",e,"unable to parse as json")}}};u([r.aC],ReactBaseElement.prototype,"embeddedData",void 0),u([r.aC],ReactBaseElement.prototype,"ssrError",void 0),u([r.aC],ReactBaseElement.prototype,"reactRoot",void 0);try{c.displayName||(c.displayName="REACT_INVARIANT_ERROR_REGEX")}catch{}}},e=>{var t=t=>e(e.s=t);e.O(0,["primer-react-css","react-lib","vendors-node_modules_primer_behaviors_dist_esm_index_mjs","vendors-node_modules_github_mini-throttle_dist_index_js-node_modules_primer_octicons-react_di-5313f5","vendors-node_modules_primer_react_lib-esm_Button_Button_js","vendors-node_modules_primer_react_lib-esm_TooltipV2_Tooltip_js","vendors-node_modules_primer_react_node_modules_primer_octicons-react_dist_index_esm_mjs","vendors-node_modules_primer_react_lib-esm_ActionList_index_js","vendors-node_modules_primer_react_lib-esm_KeybindingHint_KeybindingHint_js-node_modules_githu-3fe5e5","vendors-node_modules_primer_react_lib-esm_Dialog_Dialog_js-node_modules_primer_react_lib-esm_-405e51","ui_packages_react-core_create-browser-history_ts-ui_packages_safe-storage_safe-storage_ts-ui_-146db5"],()=>t(34968)),e.O()}]);
//# sourceMappingURL=keyboard-shortcuts-dialog-ff16e1a4f8c1.js.map