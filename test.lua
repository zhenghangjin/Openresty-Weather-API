local cityParam = ngx.req.get_uri_args(); --获取uri的城市名
local cityName = 'beijing';               --默认是北京
if cityParam['city'] ~= nil then          --如果url带有city参数，取参数
	cityName = cityParam['city'];
end

--正向代理到 nginx 的 /weather_proxy url
local res = ngx.location.capture("/weather_proxy",{
	args={city=cityName} --带参数访问
})

ngx.say(res.body)
