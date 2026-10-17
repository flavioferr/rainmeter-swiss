-- Preenche a faixa da semana (segunda a domingo) e marca o dia atual.

function Initialize()
end

function Update()
	local t = os.date('*t')
	local today = (t.wday + 5) % 7 -- segunda = 0
	local noon = os.time{ year = t.year, month = t.month, day = t.day, hour = 12 }
	local onAccent = SKIN:GetVariable('AccentText')
	local text = SKIN:GetVariable('Text')
	local dim = SKIN:GetVariable('TextDim')
	for i = 0, 6 do
		local d = os.date('*t', noon + (i - today) * 86400)
		SKIN:Bang('!SetOption', 'MeterDay' .. i, 'Text', tostring(d.day))
		SKIN:Bang('!SetOption', 'MeterDay' .. i, 'FontColor', i == today and onAccent or text)
		SKIN:Bang('!SetOption', 'MeterLetter' .. i, 'FontColor', i == today and onAccent or dim)
	end
	SKIN:Bang('!SetVariable', 'TodayIdx', tostring(today))
	return today
end
