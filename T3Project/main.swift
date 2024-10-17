//
//  main.swift
//  T3Project
//
//  Created by Mikhail Zhigulin in 7531.
//
//  Copyright © 7531 - 7533 Mikhail A. Zhigulin of Novosibirsk
//
//  The year starts from the creation of the world in the Star temple
//  according to a Slavic calendar. September, the 1st of Slavic year.
//
//  See LICENSE for details. All rights reserved.
//

import Cocoa

import ConsolePerseusLogger

import class PerseusDarkMode.PerseusLogger
import class PerseusUISystemKit.PerseusLogger

typealias PerseusDarkModeLogger = PerseusDarkMode.PerseusLogger
typealias PerseusUISystemKitLogger = PerseusUISystemKit.PerseusLogger

// MARK: - Logger

// By default.

// MARK: - External Loggers

PerseusDarkModeLogger.turned = .on
PerseusUISystemKitLogger.turned = .on

// MARK: - Construct the app's top elements

log.message("The app's start point...", .info)

let app = NSApplication.shared

let appPurpose = NSClassFromString("TestingAppDelegate") as? NSObject.Type
let appDelegate = appPurpose?.init() ?? AppDelegate()

let storyboard = NSStoryboard(name: String(describing: MainWindowController.self), bundle: nil)
let screen = storyboard.instantiateInitialController() as? NSWindowController
let mainMenu = NSNib(nibNamed: NSNib.Name("MainMenu"), bundle: nil)

// MARK: - Make the app run

app.setActivationPolicy(.regular)

mainMenu?.instantiate(withOwner: app, topLevelObjects: nil)
screen?.window?.makeKeyAndOrderFront(nil)

app.delegate = appDelegate as? NSApplicationDelegate

app.activate(ignoringOtherApps: true)
app.run()
