/*
 * Copyright (c) 2022 Application Library Engineering Group.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { DrawerSize, MenuOption, Drawer } from '@ohos/navigation-drawer'

@Entry
@Component
struct Index {
  @State visible: boolean = false
  menu: MenuOption[] = [
    new MenuOption('0', "In", $r('app.media.send')),
    new MenuOption('2', "Outbox", $r('app.media.send')),
    new MenuOption('3', "Favourites", $r('app.media.favorite')),
    new MenuOption('4', "Delete", $r('app.media.delete')),
  ]
  extraOptions: MenuOption[] = [
    new MenuOption('6', "Settings", $r('app.media.settings')),
    new MenuOption('7', "Help & Feedback", $r('app.media.help'))
  ]
  backgroundColor: string | Color = Color.White
  model: Drawer.Model = new Drawer.Model()
  menuModel: Drawer.MenuModel = new Drawer.MenuModel()

  aboutToAppear() {
    this.model.setSize(DrawerSize.Medium)
    this.model.setTitleFontSize("25fp")
    this.model.setTitleFontColor("#41454B")
    this.model.setTitle("Mail")
    this.model.setShadowColor(Color.Black)
    this.model.setShadowOpacity(0.2)
    this.model.setBackgroundColor(Color.White)
    this.model.setMenu(this.menu)
    this.model.setExtraMenu(this.extraOptions)

    this.menuModel.setActiveBackgroundColor('#A020F0')
    this.menuModel.setActiveFontColor(Color.Black)
    this.menuModel.setFontColor("#646364")
    this.menuModel.setBackgroundColor(Color.White)
    this.menuModel.setPadding('5vp')
    this.menuModel.setBorderRadius('20vp')

    this.menu[0].setID('1').setValue("Inbox").setIcon($r("app.media.inbox"))
  }

  build() {
    Stack() {
      Column() {
        Button('Open side Drawer').onClick(() => {
          animateTo({ duration: 500 }, () => {
            this.visible = !this.visible
          })
        })
      }

      Drawer({
        selected: '1',
        visible: $visible,
        model: this.model,
        menuModel: this.menuModel,
      })
    }
    .width('100%')
    .height('100%')
  }
}