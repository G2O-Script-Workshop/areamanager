class Area
{
	points = null

	minY = null
	maxY = null

	world = null

	constructor(arg)
	{
		points = arg.points
		world = arg.world.toupper()

		if ("minY" in arg)
			minY = arg.minY

		if ("maxY" in arg)
			maxY = arg.maxY
	}

	function isIn(x, y, z, world)
	{
		if (world != this.world)
			return false

		if (minY != null && maxY != null
			&& y > maxY || y < minY)
			return false

		local pointsCount = points.len()
		local j = pointsCount - 1

		local isIn = false

		for (local i = 0; i < pointsCount; j = i++)
		{
			if ( (points[i].z > z) != (points[j].z > z)
			&& (x < (points[j].x - points[i].x) * (z - points[i].z) / (points[j].z - points[i].z) + points[i].x) )
			{
				isIn = !isIn
			}
		}

		return isIn
	}
}
