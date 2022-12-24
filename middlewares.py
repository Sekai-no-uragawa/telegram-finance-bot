"""Аутентификация — пропускаем сообщения только от одного Telegram аккаунта"""
from aiogram import types
from aiogram.dispatcher.handler import CancelHandler
from aiogram.dispatcher.middlewares import BaseMiddleware

from typing import List

class AccessMiddleware(BaseMiddleware):
    def __init__(self, access_id_list: List):
        self.access_id = access_id_list
        super().__init__()

    async def on_process_message(self, message: types.Message, _):
        if int(message.from_user.id) not in [int(id) for id in self.access_id]:
            await message.answer("Access Denied")
            raise CancelHandler()
