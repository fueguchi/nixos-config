import app from "ags/gtk4/app"
import { Gtk } from "ags/gtk4"
function MyBar() {
  return (
    <window>
      <box>
        <label label="daskmd"/>
      </box>
    </window>
  )
}
app.start({
  main() {
    Bar(0)
  },
})
