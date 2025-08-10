#Requires AutoHotKey v2.0.19
#Warn
#SingleInstance force
#Include '%A_ScriptDir%\source.ahk'

ui := Gui('-DpiScale')
ui.LastPost := ''
ui.SetFont('q5 s13', 'Maple mono')
cPost := ui.Add('Edit', '+WantTab w1290 h900 vPost')

ui.Add('Button', '+Default', 'Convert').OnEvent('Click',     (*) => (cPost.value := ParsePost()))
ui.Add('Button', 'yp x+5', 'Restore').OnEvent('Click',       (*) => (cPost.value := ui.LastPost))
ui.Add('Button', 'yp x+5', 'Copy').OnEvent('Click',          (*) => (A_Clipboard := ui.Submit(0).Post))
ui.Add('Button', 'yp x+5', 'Clear').OnEvent('Click',         (*) => (cPost.value := ''))

ui.Add('Button', 'yp x+15', 'Open').OnEvent('Click',         (*) => (cPost.value := ParseFile()))
ui.Add('Button', 'yp x+5 Section', 'Save').OnEvent('Click',  (*) => (SaveFile(ui.Submit(0).Post)))

ui.Add('Text', 'ys+11 x+20', 'Repository')
ui.Add('Edit', 'ys+6  x+5 w540 vRepository', lastRepo)

ui.OnEvent('Escape', (*) => ui.Destroy())
ui.Show()


ParsePost() {
    global ui
    u := ui.Submit(0)
    ui.LastPost := u.Post
    SaveRepository(u.Repository)
    
    return Convert(u.Post, u.Repository)
}

ParseFile() {
    global ui
    u := ui.Submit(0)
    ui.LastPost := u.Post
    SaveRepository(u.Repository)
    
    return OpenFile(u.Repository)
}