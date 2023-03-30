import { ss } from '@/utils/storage'

const LOCAL_NAME = 'settingsStorage'

export interface SettingsState {
  systemMessage: string
}

export function defaultSetting(): SettingsState {
  const currentDate = new Date().toISOString().split('T')[0]
  return {
    systemMessage: 'Bạn là ChatGPT, một mô hình ngôn ngữ lớn do OpenAI đào tạo. Trả lời ngắn gọn nhất có thể.\nngưỡng kiến thức: 2021-09-01\nNgày hiện tại: ${currentDate}',
  }
}

export function getLocalState(): SettingsState {
  const localSetting: SettingsState | undefined = ss.get(LOCAL_NAME)
  return { ...defaultSetting(), ...localSetting }
}

export function setLocalState(setting: SettingsState): void {
  ss.set(LOCAL_NAME, setting)
}

export function removeLocalState() {
  ss.remove(LOCAL_NAME)
}
