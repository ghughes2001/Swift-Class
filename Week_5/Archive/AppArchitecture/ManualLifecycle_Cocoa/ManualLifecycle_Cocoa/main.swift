import Cocoa

var running: Bool = true

class Application: NSApplication {}
class AppDelegate: NSObject, NSApplicationDelegate {}

let app = Application.shared
let delegate = AppDelegate()
app.delegate = delegate
app.finishLaunching()

// Create the application window manually
let monitor = NSScreen.screens[1].visibleFrame
let window = NSWindow(
	contentRect: NSMakeRect(monitor.minX + 100, monitor.minY + 100, 400, 300),
	styleMask: [.titled, .closable, .resizable],
	backing: .buffered,
	defer: false)

window.title = "Manual Run Loop Cocoa App"
window.makeKeyAndOrderFront(nil)
// Main event loop - simplified manual polling
while running {
	autoreleasepool {
		// Poll for events, wait up to 0.1 sec
		if let event = app.nextEvent(
			matching: .any,
			until: Date().addingTimeInterval(0.1),
			inMode: .default,
			dequeue: true
		) {
			print(event)
			// draw_ui()
			//  24  fps: Movie Standard
			//  30  fps: Some TV, "High Fidelity "AAA" Games
			//  60  fps: Display refresh rate. User Interface, Most Games.
			// 100+ fps: VR, Competitive gaming frame-rate.
			app.sendEvent(event)
		} else {
			// No event, do idle work here if needed
		}
	}
}
