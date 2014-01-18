package com.common.model;

import java.io.Serializable;

public class PaginationBean implements Serializable
{
	public static final int PAGESIZE = 5;
	private static final long serialVersionUID = 416489995091575203L;
	public int totalPages;
	private int currentPage;
	private int pageSize;
	private int totalRows;
	private int startNum;
	private int nextPage;
	private int previousPage;
	private boolean hasNextPage;
	private boolean hasPreviousPage;
	public PaginationBean()
	{
		this(0, 1, 5);
	}

	public PaginationBean(int totalRows)
	{
		this(totalRows, 1, 5);
	}

	public PaginationBean(int totalRows, int currentPage)
	{
		this(totalRows, currentPage, 5);
	}

	public PaginationBean(int totalRows, int currentPage, int pageSize)
	{
		totalPages = 0;
		this.currentPage = 1;
		this.pageSize = 0;
		this.totalRows = 0;
		startNum = 0;
		nextPage = 0;
		previousPage = 0;
		hasNextPage = false;
		hasPreviousPage = false;
		this.pageSize = pageSize;
		this.currentPage = currentPage;
		this.totalRows = totalRows;
		repaginate();
	}

	public void repaginate()
	{
		if(totalRows % pageSize == 0)
		{
			totalPages = totalRows / pageSize;
		}
		else
		{
			totalPages = totalRows / pageSize + 1;
		}
		if(currentPage >= totalPages)
		{
			hasNextPage = false;
			currentPage = totalPages;
		} 
		else
		{
			hasNextPage = true;
		}
		if(currentPage <= 1)
		{
			hasPreviousPage = false;
			currentPage = 1;
		} else
		{
			hasPreviousPage = true;
		}
		startNum = (currentPage - 1) * pageSize;
		nextPage = currentPage + 1;
		if(nextPage >= totalPages)
		{
			nextPage = totalPages;
		}
		previousPage = currentPage - 1;
		if(previousPage <= 1)
		{
			previousPage = 1;
		}
	}

	public boolean isHasNextPage()
	{
		return hasNextPage;
	}

	public boolean isHasPreviousPage()
	{
		return hasPreviousPage;
	}

	public int getNextPage()
	{
		return nextPage;
	}

	public void setNextPage(int nextPage)
	{
		this.nextPage = nextPage;
	}

	public int getPreviousPage()
	{
		return previousPage;
	}

	public void setPreviousPage(int previousPage)
	{
		this.previousPage = previousPage;
	}

	public int getCurrentPage()
	{
		return currentPage;
	}

	public void setCurrentPage(int currentPage)
	{
		this.currentPage = currentPage;
	}

	public int getPageSize()
	{
		return pageSize;
	}

	public void setPageSize(int pageSize)
	{
		this.pageSize = pageSize;
	}

	public int getTotalPages()
	{	
		return totalPages;
	}

	public int getTotalRows()
	{
		return totalRows;
	}

	public void setTotalRows(int totalRows)
	{
		this.totalRows = totalRows;
	}

	public void setHasPreviousPage(boolean hasPreviousPage)
	{
		this.hasPreviousPage = hasPreviousPage;
	}

	public int getStartNum()
	{
		return startNum;
	}

	public void setStartNum(int startNum) 
	{
		this.startNum = startNum;
	}

	public void setHasNextPage(boolean hasNextPage) 
	{
		this.hasNextPage = hasNextPage;
	}

	public void setTotalPages(int totalPages) 
	{
		this.totalPages = totalPages;
	}

}
