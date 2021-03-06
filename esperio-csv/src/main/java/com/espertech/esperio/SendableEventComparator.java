/**************************************************************************************
 * Copyright (C) 2006-2015 EsperTech Inc. All rights reserved.                        *
 * http://www.espertech.com/esper                                                          *
 * http://www.espertech.com                                                           *
 * ---------------------------------------------------------------------------------- *
 * The software in this package is published under the terms of the GPL license       *
 * a copy of which has been included with this distribution in the license.txt file.  *
 **************************************************************************************/
package com.espertech.esperio;

import java.util.Comparator;

/**
 * A comparator that orders SendableEvents first on sendTime, and
 * then on schedule slot.
 */
public class SendableEventComparator implements Comparator<SendableEvent>
{
	public int compare(SendableEvent one, SendableEvent two)
	{
		if(one.getSendTime() < two.getSendTime())
		{
			return -1;
		}
		else if(one.getSendTime() > two.getSendTime())
		{
			return 1;
		}
		else
		{
			return one.getScheduleSlot().compareTo(two.getScheduleSlot());
		}
	}
}
