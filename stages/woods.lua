-- woods stage (Minecraft Herobrine)
-- sky_wide / woods_wide = 扩画布版本：镜头横向跟随与变焦时都铺满，不再露黑边。
-- 原美术保持 1:1（不缩放变形），只把画布向四周延展，所以画面构图与原版一致。
-- NovaFlare (Super_Hugo Stage Editor) convention: addLuaSprite(..., true) + setObjectOrder for layering.

function onCreate()
	makeLuaSprite('sky', 'woods/sky_wide', -1502.9, -640.0)
	setObjectOrder('sky', 0)
	scaleObject('sky', 1.4286, 1.4286)
	addLuaSprite('sky', true)

	makeLuaSprite('woods', 'woods/woods_wide', -753.3, -160.4)
	setObjectOrder('woods', 1)
	scaleObject('woods', 0.6843, 0.6843)
	addLuaSprite('woods', true)
end
