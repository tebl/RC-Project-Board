# RC Project Board
This year I went as far as getting myself one of those electronic games advent calendards, the kind where you get a book, a handful of components and then you get to build some a few different games using those components. Unfortunately it's one of those that only comes with a pre-programmed microcontroller and no sourcecode, so it never felt like I was building much of anything - just randomly inserting components into undocumented pins and then hope that the anonymous black box does most of the fun stuff!

Never got to the end of the book, if I'm going to build it then I'm going to build it using either an Arduino or one of my retro-computer builds - so, this project was created as a way of probably someday doing all of those things. This project is composed of two separate parts, the projet platforms boards that the retro-computer builds plugs into and the various projects that you either construct yourself on a breadboard or slot on top one of the provided PCB designs.

![RC-ONE with project](https://github.com/tebl/RC-Project-Board/raw/master/projects/PB-002%20Covox%20Sound/gallery/2020-01-08%2023.31.19.jpg)

Pictured above is how my [RC-ONE](https://github.com/tebl/RC-ONE) looks while slotted into the [6502 Project Platform](https://github.com/tebl/RC-Project-Board/tree/master/platforms/PP%206502), the [PB-002 Covox Sound](https://github.com/tebl/RC-Project-Board/tree/master/projects/PB-002%20Covox%20Sound) project has been slotted on top instead of the usual breadboard. Below that is the [6502 Project Platform](https://github.com/tebl/RC-Project-Board/tree/master/platforms/PP%206502) with a 400 point breadboard fitting neatly on the board, if you want more space to play around you could also use the 830 point breadboard with parts of it hanging over the sides - not pretty, but oh so practical!

![6502 Project Platform](https://github.com/tebl/RC-Project-Board/raw/master/platforms/PP%206502/gallery/2020-01-08%2023.33.26.jpg)

## Project platforms
To keep things somewhat on the simple side of things I've decided to limit myself to just doing digital I/O, leaving all of the analog stuff at the door - probably a project for another rainy day! Therefore in the context of this project I'm defining a project platform as any system capable of providing at least 16 digital I/O lines, each consists of a dedicated PCB that should take care of connecting the things together in the fashion expected by each project. Sound difficult? That just means you're probably overthinking things, the general idea is to make it so that each project would look and connects the same way no matter the platform used.

The following project platforms have been made available, refer to the table below for an overview of platforms including a separate listing each of my retro-computers that can be used with that specific platform. Note that while I hope people'll build all of my designs, you'll only need a single platform board and one of the associated systems to connect to it to get started.

| Platform | Supported system |
| -------- | --------- |
| [6502](https://github.com/tebl/RC-Project-Board/tree/master/platforms/PP%206502) | [BE6502: Build a 6502 computer](https://github.com/tebl/BE6502) |
|  | [RC-ONE: KIM-1 Replica](https://github.com/tebl/RC-ONE) |
|  | [RC6502: Apple 1 Replica](https://github.com/tebl/RC6502-Apple-1-Replica) |
|  | [RC6802 Microchicken](https://github.com/tebl/RC6802-Microchicken) |
| [Arduino](https://github.com/tebl/RC-Project-Board/tree/master/platforms/PP%20Arduino) | Arduino Nano |

## Projects
The projects are whatever you'd like to build for yourself, but if you're just looking for ideas on a few fun projects to play around with then I've probably got you covered as long as you're not looking for the most advanced stuff from someone who just dabbles in simple electronics. Most of the projects can be constructed on the breadboard by themselves by connecting the signals using female to male dupont wires (*seems most reliable that way*), but a few of the more advanced one will also come with their own PCB-designs that you can opt to build instead - these just slot on top of the platform board instead.

The breadboard oriented designs will be prefixed **BB** and a project number, similarly the ones with their own PCBs have been prefixed **PB** instead. The project number probably won't carry all that much meaning over time, so just pick something that sounds interesting and have a go at building it! Given the differences in platforms the code'll be somewhat or even completely different for each of the various systems, so there'll be varying amounts of code available for each - on the other hand, converting between them or coming up with your own versions of the code will probably be where most of the fun is at.

| Project | Description |
| ------- | ----------- |
| [PB-001 Prototyping](https://github.com/tebl/RC-Project-Board/tree/master/projects/PB-001%20Prototyping) * | Used when moving design from breadboard to a soldered together version |
| [PB-002 Covox Sound](https://github.com/tebl/RC-Project-Board/tree/master/projects/PB-002%20Covox%20Sound) * | Build a Covox sound card (sort of) |
| [PB-003 LED Cube](https://github.com/tebl/RC-Project-Board/tree/master/projects/PB-003%20LED%20Cube) * | Build one of those fancy 4x4 LED cubes |

*) Project has not been completely tested