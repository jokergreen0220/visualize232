/****************************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the Qt Quick Controls module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Digia Plc and its Subsidiary(-ies) nor the names
**     of its contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Private 1.0
/*!
    \qmltype TextAreaOwn
    \inqmlmodule QtQuick.Controls 1.0
    \since QtQuick.Controls 1.0
    \ingroup controls
    \brief Displays multiple lines of editable formatted text.

    It can display both plain and rich text. For example:

    \qml
    TextAreaOwnOwn {
        width: 240
        text: "<b>Hello</b> <i>World!</i>"
    }
    \endqml

    Clipboard support is provided by the cut(), copy(), and paste() functions, and the selection can
    be handled in a traditional "mouse" mechanism by setting selectByMouse, or handled completely
    from QML by manipulating selectionStart and selectionEnd, or using selectAll() or selectWord().

    You can translate between cursor positions (characters from the start of the document) and pixel
    points using positionAt() and positionToRectangle().

    \sa TextField, TextEdit
*/

ScrollView {
    id: area

    /*!
        \qmlproperty bool TextAreaOwn::activeFocusOnPress

        Whether the TextEdit should gain active focus on a mouse press. By default this is
        set to true.
    */
    property alias activeFocusOnPress: edit.activeFocusOnPress

    /*!
        \qmlproperty url TextAreaOwn::baseUrl

        This property specifies a base URL which is used to resolve relative URLs
        within the text.

        The default value is the url of the QML file instantiating the TextAreaOwn item.
    */
    property alias baseUrl: edit.baseUrl

    /*!
        \qmlproperty bool TextAreaOwn::canPaste

        Returns true if the TextAreaOwn is writable and the content of the clipboard is
        suitable for pasting into the TextAreaOwn.
    */
    readonly property alias canPaste: edit.canPaste

    /*!
        \qmlproperty bool TextAreaOwn::canRedo

        Returns true if the TextAreaOwn is writable and there are \l {undo}{undone}
        operations that can be redone.
    */
    readonly property alias canRedo: edit.canRedo

    /*!
        \qmlproperty bool TextAreaOwn::canUndo

        Returns true if the TextAreaOwn is writable and there are previous operations
        that can be undone.
    */
    readonly property alias canUndo: edit.canUndo

    /*!
        \qmlproperty color TextAreaOwn::textColor

        The text color.

        \qml
         TextAreaOwn { color: "orange" }
        \endqml
    */
    property alias textColor: edit.color

    /*!
        \qmlproperty int TextAreaOwn::cursorPosition
        The position of the cursor in the TextAreaOwn.
    */
    property alias cursorPosition: edit.cursorPosition

    /*! \qmlproperty font TextAreaOwn::font

        The font of the TextAreaOwn.
    */
    property alias font: edit.font

    /*!
        \qmlproperty enumeration TextAreaOwn::horizontalAlignment

        Sets the alignment of the text within the TextAreaOwn item's width.

        By default, the horizontal text alignment follows the natural alignment of the text,
        for example, text that is read from left to right will be aligned to the left.

        The valid values for \c horizontalAlignment are:
        \list
        \li TextEdit.AlignLeft (Default)
        \li TextEdit.AlignRight
        \li TextEdit.AlignHCenter
        \endlist

        When using the attached property LayoutMirroring::enabled to mirror application
        layouts, the horizontal alignment of text will also be mirrored. However, the property
        \c horizontalAlignment will remain unchanged. To query the effective horizontal alignment
        of TextAreaOwn, use the read-only property \c effectiveHorizontalAlignment.
    */
    property alias horizontalAlignment: edit.horizontalAlignment

    /*!
        \qmlproperty enumeration TextAreaOwn::effectiveHorizontalAlignment

        Gets the effective horizontal alignment of the text within the TextAreaOwn item's width.

        To set/get the default horizontal alignment of TextAreaOwn, use the property \c horizontalAlignment.

    */
    readonly property alias effectiveHorizontalAlignment: edit.effectiveHorizontalAlignment

    /*!
        \qmlproperty enumeration TextAreaOwn::verticalAlignment

        Sets the alignment of the text within the TextAreaOwn item's height.

        The valid values for \c verticalAlignment are:
        \list
        \li TextEdit.AlignTop
        \li TextEdit.AlignBottom
        \li TextEdit.AlignVCenter (Default)
        \endlist
    */
    property alias verticalAlignment: edit.verticalAlignment

    /*!
        \qmlproperty enumeration TextAreaOwn::inputMethodHints

        Provides hints to the input method about the expected content of the text edit, and how it
        should operate.

        The value is a bit-wise combination of flags or Qt.ImhNone if no hints are set.

        The default value is \c Qt.ImhNone.

        Flags that alter behavior are:

        \list
        \li Qt.ImhHiddenText - Characters should be hidden, as is typically used when entering passwords.
        \li Qt.ImhSensitiveData - Typed text should not be stored by the active input method
                in any persistent storage like predictive user dictionary.
        \li Qt.ImhNoAutoUppercase - The input method should not try to automatically switch to upper case
                when a sentence ends.
        \li Qt.ImhPreferNumbers - Numbers are preferred (but not required).
        \li Qt.ImhPreferUppercase - Upper case letters are preferred (but not required).
        \li Qt.ImhPreferLowercase - Lower case letters are preferred (but not required).
        \li Qt.ImhNoPredictiveText - Do not use predictive text (i.e. dictionary lookup) while typing.

        \li Qt.ImhDate - The text editor functions as a date field.
        \li Qt.ImhTime - The text editor functions as a time field.
        \endlist

        Flags that restrict input (exclusive flags) are:

        \list
        \li Qt.ImhDigitsOnly - Only digits are allowed.
        \li Qt.ImhFormattedNumbersOnly - Only number input is allowed. This includes decimal point and minus sign.
        \li Qt.ImhUppercaseOnly - Only upper case letter input is allowed.
        \li Qt.ImhLowercaseOnly - Only lower case letter input is allowed.
        \li Qt.ImhDialableCharactersOnly - Only characters suitable for phone dialing are allowed.
        \li Qt.ImhEmailCharactersOnly - Only characters suitable for email addresses are allowed.
        \li Qt.ImhUrlCharactersOnly - Only characters suitable for URLs are allowed.
        \endlist

        Masks:

        \list
        \li Qt.ImhExclusiveInputMask - This mask yields nonzero if any of the exclusive flags are used.
        \endlist
    */
    property alias inputMethodHints: edit.inputMethodHints

    /*!
        \qmlproperty int TextAreaOwn::length

        Returns the total number of plain text characters in the TextAreaOwn item.

        As this number doesn't include any formatting markup, it may not be the same as the
        length of the string returned by the \l text property.

        This property can be faster than querying the length the \l text property as it doesn't
        require any copying or conversion of the TextAreaOwn's internal string data.
    */
    readonly property alias length: edit.length

    /*!
        \qmlproperty int TextAreaOwn::lineCount

        Returns the total number of lines in the TextAreaOwn item.
    */
    readonly property alias lineCount: edit.lineCount

    /*!
        \qmlproperty bool TextAreaOwn::readOnly

        Whether the user can interact with the TextAreaOwn item.

        The difference from a disabled text field is that it will appear
        to be active, and text can be selected and copied.

        If this property is set to \c true, the text cannot be edited by user interaction.

        By default this property is \c false.
    */
    property alias readOnly: edit.readOnly

    /*!
        \qmlproperty string TextAreaOwn::selectedText

        This read-only property provides the text currently selected in the
        text edit.
    */
    readonly property alias selectedText: edit.selectedText

    /*!
        \qmlproperty int TextAreaOwn::selectionEnd

        The cursor position after the last character in the current selection.

        This property is read-only. To change the selection, use select(start,end),
        selectAll(), or selectWord().

        \sa selectionStart, cursorPosition, selectedText
    */
    readonly property alias selectionEnd: edit.selectionEnd

    /*!
        \qmlproperty int TextAreaOwn::selectionStart

        The cursor position before the first character in the current selection.

        This property is read-only. To change the selection, use select(start,end),
        selectAll(), or selectWord().

        \sa selectionEnd, cursorPosition, selectedText
    */
    readonly property alias selectionStart: edit.selectionStart

    /*!
        \qmlproperty bool TextAreaOwn::tabChangesFocus

        This property holds whether Tab changes focus, or is accepted as input.

        Defaults to \c false.
    */
    property bool tabChangesFocus: false

    /*!
        \qmlproperty string TextAreaOwn::text

        The text to display. If the text format is AutoText the text edit will
        automatically determine whether the text should be treated as
        rich text. This determination is made using Qt::mightBeRichText().
    */
    property alias text: edit.text

    /*!
        \qmlproperty enumeration TextAreaOwn::textFormat

        The way the text property should be displayed.

        \list
        \li TextEdit.AutoText
        \li TextEdit.PlainText
        \li TextEdit.RichText
        \endlist

        The default is TextEdit.PlainText.  If the text format is TextEdit.AutoText the text edit
        will automatically determine whether the text should be treated as
        rich text. This determination is made using Qt::mightBeRichText().
    */
    property alias textFormat: edit.textFormat

    /*!
        \qmlproperty enumeration TextAreaOwn::wrapMode

        Set this property to wrap the text to the TextAreaOwn item's width.
        The text will only wrap if an explicit width has been set.

        \list
        \li TextEdit.NoWrap - no wrapping will be performed. If the text contains insufficient newlines, then implicitWidth will exceed a set width.
        \li TextEdit.WordWrap - wrapping is done on word boundaries only. If a word is too long, implicitWidth will exceed a set width.
        \li TextEdit.WrapAnywhere - wrapping is done at any point on a line, even if it occurs in the middle of a word.
        \li TextEdit.Wrap - if possible, wrapping occurs at a word boundary; otherwise it will occur at the appropriate point on the line, even in the middle of a word.
        \endlist

        The default is \c TextEdit.NoWrap. If you set a width, consider using TextEdit.Wrap.
    */
    property alias wrapMode: edit.wrapMode

    /*!
        \qmlproperty bool TextAreaOwn::selectByMouse

        This property determines if the user can select the text with the
        mouse.

        The default value is \c true.
    */
    property alias selectByMouse: edit.selectByMouse

    /*!
        \qmlproperty bool TextAreaOwn::selectByKeyboard

        This property determines if the user can select the text with the
        keyboard.

        If set to \c true, the user can use the keyboard to select the text
        even if the editor is read-only. If set to \c false, the user cannot
        use the keyboard to select the text even if the editor is editable.

        The default value is \c true when the editor is editable,
        and \c false when read-only.

        \sa readOnly
    */
    property alias selectByKeyboard: edit.selectByKeyboard

    /*!
        \qmlsignal TextAreaOwn::linkActivated(string link)

        This signal is emitted when the user clicks on a link embedded in the text.
        The link must be in rich text or HTML format and the
        \a link string provides access to the particular link.
    */
    signal linkActivated(string link)

    /*!
        \qmlmethod TextAreaOwn::append(string)

        Appends \a string as a new line to the end of the text area.
    */
    function append (string) {
        if (length)
            string = "\n" + string
        text += string
        __verticalScrollBar.value = __verticalScrollBar.maximumValue
    }

    function appendSameLine (string) {
        text += string
        __verticalScrollBar.value = __verticalScrollBar.maximumValue
    }

    /*!
        \qmlmethod TextAreaOwn::copy()

        Copies the currently selected text to the system clipboard.
    */
    function copy() {
        edit.copy();
    }

    /*!
        \qmlmethod TextAreaOwn::cut()

        Moves the currently selected text to the system clipboard.
    */
    function cut() {
        edit.cut();
    }

    /*!
        \qmlmethod TextAreaOwn::deselect()

        Removes active text selection.
    */
    function deselect() {
        edit.deselect();
    }

    /*!
        \qmlmethod string TextAreaOwn::getFormattedText(int start, int end)

        Returns the section of text that is between the \a start and \a end positions.

        The returned text will be formatted according to the \l textFormat property.
    */
    function getFormattedText(start, end) {
        return edit.getFormattedText(start, end);
    }

    /*!
        \qmlmethod string TextAreaOwn::getText(int start, int end)

        Returns the section of text that is between the \a start and \a end positions.

        The returned text does not include any rich text formatting.
    */
    function getText(start, end) {
        return edit.getText(start, end);
    }

    /*!
        \qmlmethod TextAreaOwn::insert(int position, string text)

        Inserts \a text into the TextAreaOwn at position.
    */
    function insert(position, text) {
        edit.insert(position, text);
    }

    /*!
        \qmlmethod TextAreaOwn::isRightToLeft(int start, int end)

        Returns true if the natural reading direction of the editor text
        found between positions \a start and \a end is right to left.
    */
    function isRightToLeft(start, end) {
        return edit.isRightToLeft(start, end);
    }

    /*!
        \qmlmethod TextAreaOwn::moveCursorSelection(int position, SelectionMode mode = TextEdit.SelectCharacters)

        Moves the cursor to \a position and updates the selection according to the optional \a mode
        parameter. (To only move the cursor, set the \l cursorPosition property.)

        When this method is called it additionally sets either the
        selectionStart or the selectionEnd (whichever was at the previous cursor position)
        to the specified position. This allows you to easily extend and contract the selected
        text range.

        The selection mode specifies whether the selection is updated on a per character or a per word
        basis.  If not specified the selection mode will default to TextEdit.SelectCharacters.

        \list
        \li TextEdit.SelectCharacters - Sets either the selectionStart or selectionEnd (whichever was at
        the previous cursor position) to the specified position.
        \li TextEdit.SelectWords - Sets the selectionStart and selectionEnd to include all
        words between the specified position and the previous cursor position.  Words partially in the
        range are included.
        \endlist

        For example, take this sequence of calls:

        \code
            cursorPosition = 5
            moveCursorSelection(9, TextEdit.SelectCharacters)
            moveCursorSelection(7, TextEdit.SelectCharacters)
        \endcode

        This moves the cursor to the 5th position, extends the selection end from 5 to 9,
        and then retracts the selection end from 9 to 7, leaving the text from the 5th
        position to the 7th position selected (the 6th and 7th characters).

        The same sequence with TextEdit.SelectWords will extend the selection start to a word boundary
        before or on the 5th position, and extend the selection end to a word boundary on or past the 9th position.
    */
    function moveCursorSelection(position, mode) {
        edit.moveCursorSelection(position, mode);
    }

    /*!
        \qmlmethod TextAreaOwn::paste()

        Replaces the currently selected text by the contents of the system clipboard.
    */
    function paste() {
        edit.paste();
    }

    /*!
        \qmlmethod int TextAreaOwn::positionAt(int x, int y)

        Returns the text position closest to pixel position (\a x, \a y).

        Position 0 is before the first character, position 1 is after the first character
        but before the second, and so on until position \l {text}.length, which is after all characters.
    */
    function positionAt(x, y) {
        return edit.positionAt(x, y);
    }

    /*!
        \qmlmethod rectangle TextAreaOwn::positionToRectangle(position)

        Returns the rectangle at the given \a position in the text. The x, y,
        and height properties correspond to the cursor that would describe
        that position.
    */
    function positionToRectangle(position) {
        return edit.positionToRectangle(position);
    }

    /*!
        \qmlmethod TextAreaOwn::redo()

        Redoes the last operation if redo is \l {canRedo}{available}.
    */
    function redo() {
        edit.redo();
    }

    /*!
        \qmlmethod string TextAreaOwn::remove(int start, int end)

        Removes the section of text that is between the \a start and \a end positions from the TextAreaOwn.
    */
    function remove(start, end) {
        return edit.remove(start, end);
    }

    /*!
        \qmlmethod TextAreaOwn::select(int start, int end)

        Causes the text from \a start to \a end to be selected.

        If either start or end is out of range, the selection is not changed.

        After calling this, selectionStart will become the lesser
        and selectionEnd will become the greater (regardless of the order passed
        to this method).

        \sa selectionStart, selectionEnd
    */
    function select(start, end) {
        edit.select(start, end);
    }

    /*!
        \qmlmethod TextAreaOwn::selectAll()

        Causes all text to be selected.
    */
    function selectAll() {
        edit.selectAll();
    }

    /*!
        \qmlmethod TextAreaOwn::selectWord()

        Causes the word closest to the current cursor position to be selected.
    */
    function selectWord() {
        edit.selectWord();
    }

    /*!
        \qmlmethod TextAreaOwn::undo()

        Undoes the last operation if undo is \l {canUndo}{available}. Deselects any
        current selection, and updates the selection start to the current cursor
        position.
    */
    function undo() {
        edit.undo();
    }

    /*!
        \qmlproperty color TextAreaOwn::backgroundColor

        This property sets the background color of the viewport.

        The default value is the base color of the SystemPalette.
    */
    property alias backgroundColor: colorRect.color

    /*! \internal */
    property int documentMargins: 4

    width: 280
    height: 120

    flickableItem.contentWidth: edit.paintedWidth + (2 * documentMargins)
    frameVisible: true

    activeFocusOnTab: true

    Accessible.role: Accessible.EditableText

    /*!
        \qmlproperty textDocument TextAreaOwn::textDocument

        This property exposes the \l QTextDocument of this TextAreaOwn.
        \sa TextEdit::textDocument
    */
    property alias textDocument: edit.textDocument

    TextEdit {
        id: edit
        focus: true

        SystemPalette {
            id: palette
            colorGroup: enabled ? SystemPalette.Active : SystemPalette.Disabled
        }

        Rectangle {
            id: colorRect
            parent: viewport
            anchors.fill: parent
            color: palette.base
            z: -1
        }

        property bool recursionGuard: false

        function doLayout() {
            if (!recursionGuard) {
                recursionGuard = true
                if (wrapMode == TextEdit.NoWrap) {
                    __horizontalScrollBar.visible = edit.paintedWidth + (2 * documentMargins) > area.viewport.width
                    edit.width = edit.paintedWidth + (2 * documentMargins)
                } else {
                    __horizontalScrollBar.visible = false
                    edit.width = area.viewport.width - (2 * documentMargins)
                }
                edit.height = Math.max(area.viewport.height - (2 * documentMargins), paintedHeight + (2 * documentMargins))
                recursionGuard = false
            }
        }

        Connections {
            target: area.viewport
            onWidthChanged: edit.doLayout()
            onHeightChanged: edit.doLayout()
        }
        onPaintedWidthChanged: edit.doLayout()
        onPaintedHeightChanged: edit.doLayout()
        onWrapModeChanged: edit.doLayout()

        renderType: Text.NativeRendering

        color: palette.text
        selectionColor: palette.highlight
        selectedTextColor: palette.highlightedText
        wrapMode: TextEdit.WordWrap
        x: documentMargins
        y: documentMargins

        selectByMouse: true
        readOnly: false

        KeyNavigation.priority: KeyNavigation.BeforeItem
        KeyNavigation.tab: area.tabChangesFocus ? area.KeyNavigation.tab : null
        KeyNavigation.backtab: area.tabChangesFocus ? area.KeyNavigation.backtab : null

        // keep textcursor within scroll view
        onCursorPositionChanged: {
            if (cursorRectangle.y >= flickableItem.contentY + viewport.height - 1.5*cursorRectangle.height - documentMargins)
                flickableItem.contentY = cursorRectangle.y - viewport.height + 1.5*cursorRectangle.height + documentMargins
            else if (cursorRectangle.y < flickableItem.contentY)
                flickableItem.contentY = cursorRectangle.y

            if (cursorRectangle.x >= flickableItem.contentX + viewport.width - documentMargins) {
                flickableItem.contentX = cursorRectangle.x - viewport.width + documentMargins
            } else if (cursorRectangle.x < flickableItem.contentX)
                flickableItem.contentX = cursorRectangle.x
        }
        onLinkActivated: area.linkActivated(link)

        MouseArea {
            parent: area.viewport
            anchors.fill: parent
            cursorShape: Qt.IBeamCursor
            acceptedButtons: Qt.NoButton
        }
    }

    Keys.onPressed: {
        if (event.key == Qt.Key_PageUp) {
            __verticalScrollBar.value -= area.height
        } else if (event.key == Qt.Key_PageDown)
            __verticalScrollBar.value += area.height
    }

}
